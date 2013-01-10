# = Define: rabbitmq::plugin
#
#
define rabbitmq::plugin (
  $enseure = 'present',
  $service = $rabbitmq::service,
  $package = $rabbitmq::package,
  $service_autorestart = $rabbitmq::service_autorestart,
  ) {

  if $enseure == 'absent' {
    $action = "disable"
  } else {
    $action = "enable"
  }

  $manage_service_autorestart = $service_autorestart ? {
    true    => "Service[$service]",
    false   => undef,
  }

  exec { "rabbitmq-plugin-$name":
    command => "rabbitmq-plugins $action $name",
    notify  => Service[$manage_service_autorestart],
    require => Package[$package],
  }
}
