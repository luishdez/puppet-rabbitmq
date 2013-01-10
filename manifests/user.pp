# = Define: rabbitmq::user
#
#
define rabbitmq::user (
  $admin,
  $password,
  $version             = $rabbitmq::version,
  $service_autorestart = $rabbitmq::bool_service_autorestart,
  $service             = $rabbitmq::service,
  $absent              = $rabbitmq::absent
  ) {

  $manage_service_autorestart = $service_autorestart ? {
    true    => "Service[$service]",
    false   => undef,
  }

}
