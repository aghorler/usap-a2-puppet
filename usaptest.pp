class usaptest {
  user { 'becca':
    ensure => present,
    uid => 10011341,
    home => '/home/becca',
    managehome => true,
    groups => ['sysadmin', 'cars'],
    shell => '/bin/bash',
  }

  user { 'fred':
    ensure => present,
    uid => 10021341,
    home => '/home/fred',
    managehome => true,
    groups => ['trucks', 'cars'],
    shell => '/bin/csh',
  }

  user { 'wilma':
    ensure => present,
    uid => 10031341,
    home => '/home/wilma',
    managehome => true,
    groups => ['trucks', 'cars', 'ambulances'],
  }

  group { 'sysadmin':
    ensure => present,
  }

  group { 'trucks':
    ensure => present,
  }

  group { 'cars':
    ensure => present,
  }

  group { 'ambulances':
    ensure => present,
  }

  package { 'csh':
    ensure => present,
  }
}

