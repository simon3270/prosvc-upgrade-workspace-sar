# DEVOPS classes
class example::devops::base {
  include accounts 
  if $hostname =~ /webemaildev/ or $hostname =~ /webemailtest/ or $hostname =~ /webemailstage/ {
    include example::devops::users
  } else {
    user { gregs25:
      ensure     => absent,
    }
  }
  
#  file { "/etc/sudoers.d/devops":
#    mode    => 440,
#    owner   => root,
#    group   => root,
#    source  => "puppet:///modules/example/devops-sudoers"
#  }
}

class example::devops::users {
  include accounts
  realize (Accounts::Virtual['stevet27'])
  realize (Accounts::Virtual['michaelp23'])
  realize (Accounts::Virtual['gregs25'])
  group { "devops":
    gid    => 50001,
    ensure => "present",
  }
  file { "/etc/sudoers.d/devops":
    mode    => 440,
    owner   => root,
    group   => root,
    source  => "puppet:///modules/example/devops-sudoers"
  }
}

class example::devops::deploy::sudo {
  file { '/etc/sudoers.d/deploy':
    content => "Defaults:deploy !requiretty\ndeploy ALL=(ALL) NOPASSWD: ALL\n",
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
  }
}
