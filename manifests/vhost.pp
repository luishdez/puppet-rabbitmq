# = Define: rabbitmq::vhost
#
#
define rabbitmq::vhost (
  $package = $rabbitmq::package,
  $enseure = 'present',
  ) {

  if $enseure == 'absent' {

    exec { "rabbitmq-vhost-$name":
      command => "rabbitmqctl delete_vhost $name",
      require => Package[$package],
    }

  } else {

    exec { "rabbitmq-vhost-$name":
      command => "rabbitmqctl add_vhost $name",
      require => Package[$package],
    }

  }
}
