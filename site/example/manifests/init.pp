class example::base::users {
  include example::account::removals
  include example::admin::users
  file { "/etc/sudo-ldap.conf":
    ensure    => absent,
  }
  user { root:
    password  => '$6$0IC2z0n5$e0EsbsWVlEcR8j1zI2MF5j1dFmgFvFppytmkc0fZaut4dS/L4nZjcFQi/dY0YmJ6nY1GU74FTKn4M/4MZZlbk0',
  }
  if $::user_exists_oracle {
    user { oracle:
      managehome => true,
      password  => '$6$NSXWCxy4$OrLG5l9cXcmECbo1j9zf/14970wQ5pm20erCaujXIf8tH3.wZZ4SEPCaa.8/Gq8X7g4yo4IxCahSo1jVSW4wx.',
    }
  }
  if $::user_exists_weblogic {
    user { weblogic:
      password  => '$6$NSXWCxy4$OrLG5l9cXcmECbo1j9zf/14970wQ5pm20erCaujXIf8tH3.wZZ4SEPCaa.8/Gq8X7g4yo4IxCahSo1jVSW4wx.',
    }
  }
  if $::user_exists_splex {
    user { splex:
      password  => '$6$NSXWCxy4$OrLG5l9cXcmECbo1j9zf/14970wQ5pm20erCaujXIf8tH3.wZZ4SEPCaa.8/Gq8X7g4yo4IxCahSo1jVSW4wx.',
    }
  }
  if $::user_exists_infraadm {
    user { infraadm:
      password  => '$6$NSXWCxy4$OrLG5l9cXcmECbo1j9zf/14970wQ5pm20erCaujXIf8tH3.wZZ4SEPCaa.8/Gq8X7g4yo4IxCahSo1jVSW4wx.',
    }
  }
}
class example::base::config {
  include example::base::users
  include selinux
  include example::postfix::client
  class { 'sudo': }
  service { "ntpd":
    ensure    => stopped,
    enable    => false,
  }
  package { "eject":
    ensure    => latest,
  }
  package { "puppet":
    ensure    => latest,
  }
  service { "puppet":
    ensure    => running,
    enable    => true,
  }
  package { "openssh":
    ensure    => latest,
  }
  package { "glibc":
    ensure    => latest,
  }
  package { "bash":
    ensure    => latest,
  }
  package { "lsof":
    ensure    => latest,
  }
  case $operatingsystemrelease {
    /^6.*/: {
      package { "ntpdate":
        ensure    => latest,
      }
    }
    /^5.*/: {
      package { "python-hashlib":
        ensure    => present,
      }
      package { "ntp":
        ensure    => latest,
      }
    }
  }
  package { "screen":
    ensure    => latest,
  }
  package { "man":
    ensure    => latest,
  }
  package { "nfs-utils":
    ensure    => present,
  }
  service { "crond":
    ensure    => running,
    enable    => true,
  }
  limits::domain { 'maxlogins':
    maxlogins => {
      'soft' => '4',
      'hard' => '5',
    },
  }
  cron { ntpdate:
    ensure     => present,
    command    => "/usr/sbin/ntpdate ntp.example.com > /dev/null 2>&1",
    user       => root,
    minute     => '*/10',
#    require    => Package[ntpdate],
  }
  file { "/etc/init.d/firstboot":
    ensure     => Absent,
  }
}
class example::admin::users {
  include accounts
  realize (Accounts::Virtual['cade'])
  realize (Accounts::Virtual['jmalouf'])
  realize (Accounts::Virtual['clejeune'])
  realize (Accounts::Virtual['travis'])
  realize (Accounts::Virtual['alan'])
  realize (Accounts::Virtual['lanzm'])
  realize (Accounts::Virtual['brianb24'])
  # Service account for Security scanning
  realize (Accounts::Virtual['svc-nexpose'])

  sudo::conf { 'ops':
    priority   => 10,
    content    => '%wheel ALL=(ALL) NOPASSWD: ALL',
  }
}
class example::dba::users {
  include accounts
  group { "dba":
    gid        => 500,
    ensure     => "present",
  }
  realize (Accounts::Virtual['phillipc30'])
  realize (Accounts::Virtual['rob'])
  realize (Accounts::Virtual['alexm28'])
  realize (Accounts::Virtual['daves14'])
  realize (Accounts::Virtual['tysons08'])
  realize (Accounts::Virtual['mikeg02'])
  realize (Accounts::Virtual['csteab'])
  realize (Accounts::Virtual['shashi.tewari'])
  realize (Accounts::Virtual['venkat'])
  realize (Accounts::Virtual['michael.arbon'])
  sudo::conf { 'dba':
    priority   => 10,
    content    => '%dba ALL=(ALL) NOPASSWD: ALL',
  }

}
class example::erp::users {
  include accounts
  group { "erp":
    gid     => 2000,
    ensure  => "present",
  }
  file { "/etc/sudoers.d/erp-sudoers":
    mode    => 440,
    owner   => root,
    group   => root,
    source  => "puppet:///modules/example/erp-sudoers"
  }
  if $hostname =~ /obie/ {
    file { "/etc/sudoers.d/60-erp":
      mode    => 440,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/sudo/60-erp"
    }
  }
  realize (Accounts::Virtual['ravik27'])
  realize (Accounts::Virtual['krishanub16'])
  realize (Accounts::Virtual['geniel08'])
  realize (Accounts::Virtual['justinc12'])
}
class example::dev::users {
  include accounts
  group { "dev":
    gid    => 60000,
    ensure => "present",
  }
}
