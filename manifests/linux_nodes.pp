# Misc Nodes
node "puppetmaster1" {
  include example::account::removals
  include example::admin::users
  include example::devops::users
  include example::nagios::target
}
node /pocreleaseteam/ {
  include example::base::config
  include example::devops::users
}
node /coreprod2/ {
  include example::base::config
  include example::splunk::forwarder
}
node /puppetclient1/ {
  include example::base::config
  include example::iscsi::base
  include example::nagios::target
  include example::generic::tomcat::user
  include example::generic::tomcat::base
  include example::generic::java::base
}
node /intelweb/ {
  include example::base::config
  include example::microstrategyintel::base
  include example::generic::tomcat
}
node /intelapp/ {
  include example::base::config
  include example::microstrategyintel::base
}
node /mysqldbprod1/ {
  include example::base::config
  include example::dba::users
}
node /monitor1/ {
  include example::base::config
  include example::nagios::monitor
}
node /avprod/ {
  include example::base::config
  package { 'clamd': 
    ensure     => latest,
  }
  package { 'clamav':
    ensure     => latest,
  }
  package { 'clamav-db':
    ensure     => latest,
  }
}
node /biappprod/ {
  include example::base::config
  include example::erp::users
}
node /webappprod/ {
  include example::base::config
  user { "alexm28":
    ensure     => absent,
    managehome => true,
  }
  user { "tysons08":
    ensure     => absent,
    managehome => true,
  }
  user { "rob":
    ensure     => absent,
    managehome => true,
  }
  user { "mikeg02":
    ensure     => absent,
    managehome => true,
  }
  user { "daves14":
    ensure     => absent,
    managehome => true,
  }
  user { "phillipc30":
    ensure     => absent,
    managehome => true,
  }
  user { "shashi.tewari":
    ensure     => absent,
    managehome => true,
  }
  user { "venkat":
    ensure     => absent,
    managehome => true,
  }
  user { "michael.arbon":
    ensure     => absent,
    managehome => true,
  }
  user { "csteab":
    ensure     => absent,
    managehome => true,
  }
}
node 'jiraprod6.example.com' {
  include example::base::config
  include example::devops::users
}
node /ciapp/ {
  include example::base::config
  include example::tomcat::user
  include example::devops::users
}
node /indvoice1/ {
  include example::base::config
  include example::dba::users
}
node 'monprod1.example.com' {
  include example::admin::users
  include example::postfix::client
  class { 'icinga2::server':
    install_nagios_plugins => false,
  }
#  class { 'icinga2::nrpe':
#    nrpe_allow_hosts => ['10.16.47.210','127.0.0.1'],
#  }
  include example::base::config
}

node 'qualitycenter1.example.com' {
  include example::base::config
  include example::devops::users
  sudo::conf { 'devops':
    priority   => 10,
    content    => '%devops ALL=(ALL) NOPASSWD: ALL',
  }
}
node /shiplineprod/ {
  include example::base::config
  
#  file { '/etc/sudoers.d/50-qcsoftware':
#    ensure   => file,
#    owner    => root,
#    group    => root,
#    mode     => 644,
#    source   => "puppet:///modules/example/qcsoftware-sudoers",
#  }
}
node 'management1.example.com' {
  include example::base::config
}
node 'repo1.example.com' {
  include example::base::users
  include example::postfix::client
}
node /webemailprod/ {
  include example::base::config
  include example::devops::base
  include example::webemail::config
  include example::tomcat::user
  include example::splunk::forwarder
  include example::app::responsys

  realize (Accounts::Virtual['chris'])
  group { "dev":
    gid     => 60000,
    ensure  => "present",
  }
}

node /ntp1/ {
  include example::base::users
  include example::postfix::client
  service { "ntpd":
    ensure    => running,
    enable    => true,
  }
}
node /bomobile1/ {
  include example::base::config
  file { "/etc/sudoers.d/60-bobo":
    ensure    => present,
    source    => "puppet:///modules/example/bomobile-sudoers",
    owner     => root,
    group     => root,
    mode      => 0440,
  }
}

node /nfsprod1/ {
  include example::base::config
  include example::iscsi::base
}

node /bamboobuild/ {
  include example::base::config
  include example::devops::users
  include example::devops::deploy::sudo
}
node /records-management/ {
  include example::base::config
  package { "httpd":
    ensure    => latest,
  }
  service { "httpd":
    ensure    => running,
    enable    => true,
  }
}

# Misc Nodes
node /webemaildev[12].example.com/ {
  include example::base::config
  include example::devops::base
  include example::webemail::config
  include example::tomcat::user
  include example::dev::users
  include example::app::responsys

  file { "/etc/sudoers.d/99-dev":
    ensure  => present,
    content => '%tomcat ALL=(tomcat) NOPASSWD: ALL\n%tomcat ALL = NOPASSWD: /bin/su - tomcat\n',
  }
  realize (Accounts::Virtual['chris'])
  realize (Accounts::Virtual['jaredb07'])
  realize (Accounts::Virtual['john13'])
  realize (Accounts::Virtual['nickh20'])
  realize (Accounts::Virtual['jasonb22'])
}

node /webemailstage/ {
  include example::base::config
  include example::devops::base
  include example::tomcat::user
  include example::webemail::config
  if $hostname =~ /webemailstage[24]/ {
    include example::app::responsys
  }
  group { dev:
    gid   => 60000,
    ensure => present,
  }
  realize (Accounts::Virtual['chris'])
  realize (Accounts::Virtual['jaredb07'])
}

node /webcontentstage/ {
  include example::base::config
  include example::devops::users
  include example::tomcat::user
}
node /hypdbstage/ {
  include example::base::config
  include example::erp::users
}

node /shopstage/ {
  include example::base::config
  include example::shopnodes::logrotate
}

node /intelwebstage/ {
  include example::base::config
  include example::microstrategyintel::base
  include example::generic::tomcat
}
node /intelappstage/ {
  include example::base::config
  include example::microstrategyintel::base
}

node /dlmtest/ {
  include example::base::config
}
node /shiplinetest/ {
  file { '/etc/sudoers.d/50-qcsoftware':
    ensure   => file,
    owner    => root,
    group    => root,
    mode     => 644,
    source   => "puppet:///modules/example/qcsoftware-sudoers",
  }
}

node /webemailtest/ {
  include example::base::config
  include example::devops::base
  include example::webemail::config
  include example::tomcat::user
  include example::dev::users
  include example::app::responsys

  realize (Accounts::Virtual['chris'])
  realize (Accounts::Virtual['jaredb07'])
  realize (Accounts::Virtual['john13'])
  realize (Accounts::Virtual['nickh20'])

}
node /webapp/ {
  include example::base::config
}
