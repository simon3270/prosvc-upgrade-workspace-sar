# Puppet Debugging Kit
_The only good bug is a dead bug._

This project provides a batteries-included Vagrant environment for debugging Puppet powered infrastructures.


## Setup

### Install Vagrant 1.5+

https://www.vagrantup.com

### Install VirtualBox or VMWare

https://www.virtualbox.org/wiki/Downloads

https://my.vmware.com/web/vmware/info?slug=desktop\_end\_user\_computing/vmware\_fusion/8\_0


Note: You need the vmware vagrant provider plugin to use vagrant with vmware.

### Install Vagrant Plugins

Two methods are avaible depending on whether a global Vagrant installation, such as provided by the official packages from [vagrantup.com](http://vagrantup.com), is in use:

  - `rake setup:global`:
    This Rake task will add all plugins required by the debugging kit to a global Vagrant installation.

  - `rake setup:sandboxed`:
    This Rake task will use Bundler to create a completely sandboxed Vagrant installation that includes the plugins required by the debugging kit.
    The contents of the sandbox can be customized by creating a `Gemfile.local` that specifies additional gems and Bundler environment parameters.

### Running Catalog Preview

```
sudo /opt/puppet/bin/puppet preview \
  --baseline-environment production \
  --preview-environment future_production \
  --migrate 3.8/4.0 \
  --nodes /vagrant/nodes.txt \
  --view overview-json | tee /vagrant/catalog_preview_overview-baseline.json
```

### Generating a HTML report

```shell
/etc/puppetlabs/puppet/environments/production/modules/preview_report/preview_report.rb -f /vagrant/catalog_preview_overview-baseline.json -w /vagrant/preview_report.html
``` 
