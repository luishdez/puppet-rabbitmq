# = Define: rabbitmq::permissions
#
#
define rabbitmq::permissions (
  $vhost   = false,
  $conf    = "^$name-.*",
  $write   = ".*",  
  $read    = ".*",
  $package = $rabbitmq::package,
  $enseure = 'present',
  ) {

  $vhost_option = $vhost ? {
    true  => "-p $vhost",
    false => '',
  }

  if $enseure == 'absent' {

    exec { "rabbitmq-permissions-$name":
      command => "rabbitmqctl clear_permissions $vhost_option $name",
      require => Package[$package],
    }

  } else {

    exec { "rabbitmq-permissions-$name":
      command => "rabbitmqctl set_permissions $name \"$conf\" \"$write\" \"$read\"",
      require => Package[$package],
    }

  }
}
