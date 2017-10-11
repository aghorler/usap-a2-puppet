class configuration {
  file_line{ 'PermitRootLogin':
    path => '/etc/ssh/sshd_config',
    replace => true,
    line => 'PermitRootLogin No',
    match  => '^PermitRootLogin',
  }

  file_line{ 'Listen':
    path => '/etc/httpd/conf/httpd.conf',
    replace => true,
    line => 'Listen 8888',
    match  => '^Listen',
  }

  file { '/var/www/s3481341':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file_line{ 'DocumentRoot':
    path => '/etc/httpd/conf/httpd.conf',
    replace => true,
    line => 'DocumentRoot "/var/www/s3481341"',
    match  => '^DocumentRoot',
  }
}

