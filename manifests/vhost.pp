# = Define: rabbitmq::vhost
#
#
define rabbitmq::vhost (
  $package             = $rabbitmq::package,
  ) {

  if $enseure == 'absent' {

    exec { "rabbitmq-user-$name":
      command => "rabbitmqctl delete_vhost $name",
      require => Package[$package],
    }

  } else {

    exec { "rabbitmq-user-$name":
      command => "rabbitmqctl add_vhost $name",
      require => Package[$package],
    }

  }
}
