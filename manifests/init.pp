class puppet-scripts-administrador {

   case $use {
        "portatil-profesor-2011": {
           file { "/usr/local/sbin":
              source=>"puppet://puppetinstituto/puppet-scripts-administrador/portatil-profesor",
              recurse => true
           }
         }
        "portatil-alumno-2011": {
           file { "/usr/local/sbin":
              source=>"puppet://puppetinstituto/puppet-scripts-administrador/portatil-alumno",
              recurse => true
           }
        }
        "ltsp-server": {
           file { "/usr/local/sbin":
              source => "puppet://puppetinstituto/puppet-scripts-administrador/ltsp-server",
              recurse => true
           }
           
           cron { "limpieza-ltsp":
	      command => "/usr/local/sbin/cleantmpinactiveusers",
	      ensure => present,
              hour => [8-15],
	      minute => "*/5",
	      weekday => [1-5]
	   }	      
        }
        "workstation": {
           file { "/usr/local/sbin":
              source=>"puppet://puppetinstituto/puppet-scripts-administrador/workstation",
              recurse => true
           }

        }
        default: { }
   }

}
