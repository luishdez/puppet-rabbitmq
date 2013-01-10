# Class: rabbitmq::params
#
# This class defines default parameters used by the main module class rabbitmq
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to rabbitmq class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class rabbitmq::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'rabbitmq-server',
    default                   => 'rabbitmq-server',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'rabbitmq-server',
    default                   => 'rabbitmq-server',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'rabbitmq-server',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'rabbitmq',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/rabbitmq',
  }

  $config_file = $::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Fedora)/ => '/etc/rabbitmq.config',
    default                                => '/etc/rabbitmq/rabbitmq.config',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    default                   => '',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/rabbitmq.pid',
    default                   => '/var/run/rabbitmq/rabbitmq.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/rabbitmq',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/rabbitmq',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/rabbitmq/rabbitmq-server.log',
    default                   => '/var/log/rabbitmq/rabbitmq.log',
  }


  $version = '3.0.1'
  $relversion = '1'
  $package_key = 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc'
  $package_provider = 'rpm'
  $package_source = "http://www.rabbitmq.com/releases/rabbitmq-server/v${version}/rabbitmq-server-${version}-${relversion}.noarch.rpm"

  $port = '5672'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
