class services {
  service { 'sshd' :
    ensure  => running,
    enable  => true,
    require => Package['openssh'],
  }

  service { 'httpd' :
    ensure  => running,
    enable  => true,
    require => [Package['httpd'], File_Line['Listen'], File['/var/www/s3481341'],],
  }

  service { 'mysqld' :
    ensure  => running,
    enable  => true,
    require => Package['mysql-community-server'],
  }
}
