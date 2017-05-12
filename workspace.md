# Puppet 3 to 4 Upgrade Workspace

## Git Setup

1. Clone the repo down to your machine:

  `git clone https://github.com/puppetlabs/prosvc-upgrade-workspace.git`

1. Change in the repo:

   `cd prosvc-upgrade-workspace`

1. Make sure the `production` and `future_production` branches are available:

    ```
    git pull origin production
    git checkout -b future_production
    git pull origin future_production
    git checkout production
    ```

    When `r10k` runs on the PE 3.8.x Master, it will use this local directory as its control repository, so all necessary branches must be on disk.

## Vagrant Setup

1. Start by booting the PE 3.8.x Master:

    `vagrant up pe-386-master`

1. Log into the Master:

    `vagrant ssh pe-386-master`

1. Switch to root

    `sudo su -`

## Start Future-Proofing Code

### Overview

You can find a more thorough documentation on the code update process in the [Puppet upgrade docs](https://docs.puppet.com/upgrade/upgrade_code_workflow.html)

Production Puppet code lives in `/etc/puppetlabs/puppet/environments/production`.  Basically a copy of that code lives in `/etc/puppetlabs/puppet/environments/future_production`.  The difference is in future_production's `environment.conf`, the parser is set to `future` instead of `current`.

We'll use the `catalog_preview` tool in order to compile catalogs in both environments, and then compare them. 

### Catalog Preview

1. To generate a report of the differences between catalogs using the [catalog_preview module](https://forge.puppet.com/puppetlabs/catalog_preview) which is automatically included in this vagrant environment:

    ```
    /opt/puppet/bin/puppet preview \
    --baseline-environment production \
    --preview-environment future_production \
    --migrate 3.8/4.0 \
    --nodes /vagrant/nodes.txt \
    --view overview-json > /vagrant/catalog_preview_overview-baseline.json
    ```

1.  Generate HTML report for ease of reading using the [preview-report module](https://github.com/puppetlabs/prosvc-preview_report) module which is also automatically included:

    ```
    /etc/puppetlabs/puppet/environments/production/modules/preview_report/preview_report.rb \
    -f /vagrant/catalog_preview_overview-baseline.json \
    -w /vagrant/preview_report.html
    ```

    The `preview_report.html` will show at first, the top 10 nodes with the most issues.  You can click into each node to observe the specific areas that are causing differences.

### Types of Errors

#### Compilation Errors
These errors will show up when you run the `puppet preview` command.  If the "future" catalog can't even compile due to an error, you'll get a red output to STDOUT.  Because the process fails, nothing will be written to `catalog_preview_overview-baseline.json`.  An example of this type of error might be the value `"hello"` in Puppet 3 could be possibly be manipulated as an Array, whereas Puppet 4 would strictly recognize this as a String and fail to compile if any Array methods are used.

#### Migration Codes
Reference the [migration codes](https://forge.puppet.com/puppetlabs/catalog_preview#migration-warnings) page for all types.  These are recognized errors that are typical to a Puppet 3 to 4 migration such as the difference between the String `"644"` and the Integer `644`.

### Making Changes

Make your changes to the code in the `future_production`.  You can rerun the `puppet preview` and `preview_report.rb` commands as you go until you have zero errors left to address in the report.

When you are done future-proofing, we'll need to get this new code back into the control-repo so it can be deployed onto a new PE 2016.x Master.  The follow process is specific to this Vagrant environment.  You'll need to vary it depending on the customer's setup.  A sample customer example will follow.

1. On your local machine, switch branches to `future_production` so it is available to the VM at `/vagrant`:

    ```
    git checkout future_production
    ```

1. On the Master, copy the new code to the repository which is shared to the VM:

    ```
    find /etc/puppetlabs/puppet/environments/future_production/* \
    -maxdepth 0 \
    -not -path '*/\.*' \
    -exec cp -afR {} /vagrant \;
    ```

___NOTE___: Be sure not to copy your `.git` directories along with your other files and directories, or you will ruin your Git history and settings.

1. Send changes to your control repository from your local machine:

    ```
    git add -A .
    git commit -m "Future proofed Puppet code for upgrade"
    git checkout production
    git merge future_production
    ```

__Sample Customer Setup__

1. Clone the customer control repository to somewhere you can work with it.
1. Switch to the `future_production` branch:

    ```
    git checkout future_production
    ```

1. Tarball up the `etc/puppetlabs/puppet/environments/future_production` directory on the Master.

1. Copy the tarball and expand into where you have the repository cloned.
1. Push the changes up to the git server:

    ```
    git add -A .
    git commit -m "Future proofed Puppet code for upgrade"
    git push origin future_production
    ```

***

## New Master Setup

### Overview

All current agents have certificates signed by the CA root certificate on the 3.8.6 Master.  Migrating to a new Master with a new CA root certificate will necessitate resigning _ALL_ agent certificates.  To avoid this, we can copy the `$ssldir` to the new Master first, _before_ we install Puppet.

1. Boot the new PE Master:

    ```
    vagrant up pe-201640-master
    ```

1. Log into the new Master and copy the old `$ssldir` to the new Master:

    ```
    vagrant ssh pe-201640-master
    sudo mkdir -p /etc/puppetlabs/puppet/ssl && \
    sudo scp -r pe-386-master:/etc/puppetlabs/puppet/ssl /etc/puppetlabs/puppet
    ```

    The root password is `puppet`.

1. _(Optional)_ Suspend the PE 3.8.x Master:

    ```
    vagrant suspend pe-386-master
    ```

1. Install PE:

    ```
    sudo su -
    wget --content-disposition "https://s3.amazonaws.com/pe-builds/released/2016.4.0/puppet-enterprise-2016.4.0-el-7-x86_64.tar.gz"
    tar zxpf puppet-enterprise-2016.4.0-el-7-x86_64.tar.gz
    ./puppet-enterprise-2016.4.0-el-7-x86_64/puppet-enterprise-installer
    # Option 2 for text mode
    # Update "console_admin_password"
    # Add the following
    "puppet_enterprise::profile::master::r10k_remote": "/vagrant"
    "puppet_enterprise::profile::master::code_manager_auto_configure": true
    ```

***

## Agent Migration

### Overview
When doing this at a customer site the preference is to migrate all of their master configuration and ssl data over to a new Puppet 4.x based infrastructure as detailed in the [Puppet upgrade docs](https://docs.puppet.com/pe/latest/migrate_monolithic.html) as this allows the certificates between master and agent to continue working. There is also a [detailed agent migration doc](https://github.com/puppetlabs/cs-solutions/blob/master/upgrades/2-3x-agent-migration.md) written up by the services team

Once this is done migrating to the new infrastructure should be as easy as repointing the Puppet service address(if the customer has one) to the new server. The Puppet 3.x agents will be able to run against the puppet 4.x master without issue and can then be upgraded using the [puppet_agent module](https://forge.puppet.com/puppetlabs/puppet_agent).

If a service address does not exist then use whatever means make the most sense to update the server setting in puppet.conf to point to the new address.

We have a number of different ways to use the puppet_agent module to upgrade agents. There are modules written that can do most of what we need for us, or there are a set of manual or semi-manual steps we can take. Multiple approaches are discussed below, feel free to use whatever combination is appropriate for your situation.

#### Using an all-in-one migration solution
Note that the module below assume migration to a fresh server and that the agent will need new certificates generated for this. Carefully consider whether this is needed or whether the migration steps linked above will work instead. Regenerating agent certificates might have unexpected impacts if trusted facts are used and are not created as part of these new certificate requests.

[This module](https://github.com/dnase/puppet_agent_migrate) can be used to perform all migration steps or as a point of reference for agent migration. To use it, follow the steps below.

1. Clone the repository:
    ```
    git clone https://github.com/dnase/puppet_agent_migrate.git
    ```

1. Include the module where you need it (example usage):
    ```
    class { '::puppet_agent_migrate':
      new_master => 'mynewmaster.mydomain.com',
      flush_certs => true,
    }
    ```

#### Using puppet apply locally on agents

1. Install the puppet_agent module:

    ```
    puppet module install puppetlabs-puppet_agent
    ```

1. Run puppet apply and include puppet_agent

    ```
    puppet apply -e "include ::puppet_agent"
    ```

#### Using a classification group in the console

1. Install the puppet_agent module on the master:

    ```
    puppet module install puppetlabs-puppet_agent
    ```

1. Create a temporary classification group. Use a name like "upgrade".

1. Classify the group with the puppet_agent class or a wrapper class with site specific configuration.

1. Pin nodes on which you wish to test out upgrading.

1. Run Puppet agent on the pinned nodes.

    ```
    puppet agent -t
    ```

#### Configuring agents to use the new master manually and (optionally) flushing certificates.

1. Edit `puppet.conf` on each agent you wish to upgrade. Change the `server` configuration item to the FQDN of the new master.

2. Delete `ssldir` (if necessary):
    ```
    rm -rf $(puppet agent --configprint ssldir)
    ```
