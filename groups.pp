class groups {  
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
}
