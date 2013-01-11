# = Define: rabbitmq::user
#
#
define rabbitmq::user (
  $password,
  $tags                = '',
  $version             = $rabbitmq::version,
  $service_autorestart = $rabbitmq::bool_service_autorestart,
  $package             = $rabbitmq::package,
  $enseure             = 'present',
  ) {

  if $enseure == 'absent' {

    exec { "rabbitmq-user-$name":
      command => "rabbitmqctl delete_user $name",
      require => Package[$package],
    }

  } else {

    exec { "rabbitmq-user-$name":
      command => "rabbitmqctl add_user $name $password",
      require => Package[$package],
    }

    if $tags != '' {
      exec { "rabbitmq-user-tags-$name":
        command => "rabbitmqctl set_user_tags $name $tags",
        require => Package[$package],
      }
    }

  }
}
