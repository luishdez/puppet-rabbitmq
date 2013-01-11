# = Define: rabbitmq::permissions
#
#
define rabbitmq::permissions (
  $vhost               = false,
  $conf                = "^$name-.*",
  $write               = ".*",  
  $read                = ".*",
  $package             = $rabbitmq::package,
  ) {

  if $vhost {
    $vhost_option = "-p $vhost";
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
