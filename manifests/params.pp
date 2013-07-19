class kibana3::params {

  $ensure = 'present'

  $autoupgrade = false

  $status = 'enabled'

  $restart_on_change = false

  $proxyserv = undef

  case $::operatingsystem {
    'CentOS', 'Fedora', 'Scientific', 'OracleLinux', 'Amazon', 'RedHat': {
      $package = [ 'kibana3' ]
      $approot = '/srv/kibana3'
    }
    'Debian', 'Ubuntu': {
     # $package = [ 'kibana3' ]
     fail("\"${module_name}\" provides no deb package for \"${::operatingsystem}\"")
    }
    default: {
      fail("\"${module_name}\" provides no package default value
            for \"${::operatingsystem}\"")
    }
  }
  $config = "${approot}/config.js"

  # service parameters

  case $::operatingsystem {
    'CentOS', 'Fedora', 'Scientific', 'OracleLinux', 'Amazon', 'RedHat': {
      $service_name       = 'kibana3'
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_pattern    = $service_name
    }
    'Debian', 'Ubuntu': {
     # $service_name       = 'kibana3'
     # $service_hasrestart = true
     # $service_hasstatus  = true
     # $service_pattern    = $service_name
     fail("\"${module_name}\" provides no service parameters for \"${::operatingsystem}\"
            based systems")
    }
    default: {
      fail("\"${module_name}\" provides no service parameters
            for \"${::operatingsystem}\"")
    }
  }

}

