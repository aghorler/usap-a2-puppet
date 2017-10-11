class packages {
  package { 'openssh':
    ensure => present,
  }

  package { 'httpd':
    ensure => present,
  }

  package { 'mysql57-community-release-el7-11.noarch' :
    ensure 	 => 'installed',
    source 	 => 'https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm',
    provider => 'rpm',
  }

  package { 'mysql-community-server':
    ensure => present,
    require => Package['mysql57-community-release-el7-11.noarch'],
  }

  package { 'mysql-community-client':
    ensure => present,
    require => Package['mysql57-community-release-el7-11.noarch'],
  }

  package { 'tigervnc-server':
    ensure => present,
  }

  package { 'tmux':
    ensure => present,
  }

  package { 'dia2code-0.8.3-1.x86_64':
    ensure   => 'installed',
    source   => 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm?r=https%3A%2F%2Fsourceforge.net&ts=1507688055&use_mirror=jaist',
    provider => 'rpm',
  }

  package { 'lynx':
    ensure => present,
  }

  package { 'gcc':
    ensure => present,
  }

  package { 'gdb':
    ensure => present,
  }

  package { 'cgdb':
    ensure => present,
  }

  package { 'vim':
    ensure => present,
  }

  package { 'emacs':
    ensure => present,
  }

  package { 'sshfs':
    ensure => present,
  }
}
