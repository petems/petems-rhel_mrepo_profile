# Add Yumrepo for EPEL Mirror
class rhel_mrepo_profiles::yumrepo::epel
(
  $mrepo_master,
  $mrepo_port = '80',
)
{

  yumrepo { 'epel':
    baseurl  => "http://${mrepo_master}:${mrepo_port}/epel-${::operatingsystemmajrelease}-${::architecture}/RPMS.epel",
    descr    => "EPEL ${::operatingsystemmajrelease} ${::architecture}",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

}


