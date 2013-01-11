# = Define: rabbitmq::cluster
#
#
define rabbitmq::cluster (
  $ram     = false,
  $package = $rabbitmq::package,
  ) {

  $ram_option = $ram ? {
    true  => '--ram',
    false => '',
  }

  exec { "rabbitmq-cluster-$name":
    command => "rabbitmqctl join_cluster $name $ram_option",
    require => Package[$package],
  }
}
