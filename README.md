= Puppet module: rabbitmq

This is a Puppet rabbitmq module from the second generation of Example42 Puppet Modules.

Made by Luis Hdez / Aggressivex

Official git repository: http://github.com/aggressivex/puppet-rabbitmq

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module.

For detailed info about the logic and usage patterns of Example42 modules read README.usage on Example42 main modules set.

== USAGE - Basic management

* Install rabbitmq with default settings

        class { "rabbitmq": }

* Disable rabbitmq service.

        class { "rabbitmq":
          disable => true
        }

* Disable rabbitmq service at boot time, but don't stop if is running.

        class { "rabbitmq":
          disableboot => true
        }

* Remove rabbitmq package

        class { "rabbitmq":
          absent => true
        }

* Enable auditing without without making changes on existing rabbitmq configuration files

        class { "rabbitmq":
          audit_only => true
        }


== USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { "rabbitmq":
          source => [ "puppet:///modules/lab42/rabbitmq/rabbitmq.conf-${hostname}" , "puppet:///modules/lab42/rabbitmq/rabbitmq.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { "rabbitmq":
          source_dir       => "puppet:///modules/lab42/rabbitmq/conf/",
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file 

        class { "rabbitmq":
          template => "example42/rabbitmq/rabbitmq.conf.erb",      
        }

* Define custom options that can be used in a custom template without the
  need to add parameters to the rabbitmq class

        class { "rabbitmq":
          template => "example42/rabbitmq/rabbitmq.conf.erb",    
          options  => {
            'LogLevel' => 'INFO',
            'UsePAM'   => 'yes',
          },
        }

* Automaticallly include a custom subclass

        class { "rabbitmq:"
          my_class => 'rabbitmq::example42',
        }


== USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { "rabbitmq": 
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with
  a puppi::helper define ) to customize the output of puppi commands 

        class { "rabbitmq":
          puppi        => true,
          puppi_helper => "myhelper", 
        }

* Activate automatic monitoring (recommended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { "rabbitmq":
          monitor      => true,
          monitor_tool => [ "nagios" , "monit" , "munin" ],
        }

* Activate automatic firewalling 
  This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { "rabbitmq":       
          firewall      => true,
          firewall_tool => "iptables",
          firewall_src  => "10.42.0.0/24",
          firewall_dst  => "$ipaddress_eth0",
        }

