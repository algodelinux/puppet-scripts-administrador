class puppet-scripts-administrador {

   case $use {
        "ltsp-server": {
           file { "/usr/local/sbin":
              source => "puppet:///modules/puppet-scripts-administrador/ltsp-server",
              owner => root, group => root,		
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
        "ubuntu": {
           case $tipo {
              "notebookACER","notebookAPD","notebookXTREM","notebookHP": {
                 file { "/usr/local/sbin":
                    source=>"puppet:///modules/puppet-scripts-administrador/$tipo",
                    owner => root, group => root,		 
                    recurse => true
                 }
              }  

              "workstation": {
                 file { "/usr/local/sbin":
                    source=>"puppet:///modules/puppet-scripts-administrador/workstation",
                    owner => root, group => root,		
                    recurse => true
                 }
              }

              "siatic": {
                 file { "/usr/local/sbin/reinstallnvidia":
                    source => "puppet:///modules/puppet-scripts-administrador/siatic/reinstallnvidia",
                    owner => root, group => root, mode => 755
                 }       
                 file { "/usr/local/sbin/reconfigurenvidia":
                    source => "puppet:///modules/puppet-scripts-administrador/siatic/reconfigurenvidia",
                    owner => root, group => root, mode => 755
                 }       
              }

              "Telefonica": {
                 file { "/usr/local/sbin/reinstall_nwfermi_module":
                    source => "puppet:///modules/puppet-scripts-administrador/Telefonica/reinstall_nwfermi_module",
                    owner => root, group => root, mode => 755
                 }       
              }
              
              default: { }
           }
        }
        default: { }
   }

}
