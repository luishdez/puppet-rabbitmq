# = Define: php::module
#
#
define rabbitmq::vhost (
  $version             = $rabbitmq::version,
  $service_autorestart = $rabbitmq::bool_service_autorestart,
  $service             = $rabbitmq::service,
  $absent              = $rabbitmq::absent
  ) {

  $manage_service_autorestart = $service_autorestart ? {
    true    => "Service[$service]",
    false   => undef,
  }

  # notify  => $manage_service_autorestart,


}
