# Add Yumrepo for EPEL Mirror
class rhel_mrepo_profiles::yumrepo::epel
(
  $mrepo_master,
)
{

  yumrepo { 'epel':
    baseurl  => "http://${mrepo_master}/epel-${::operatingsystemmajrelease}-${::architecture}/RPMS.epel",
    descr    => "EPEL ${::operatingsystemmajrelease} ${::architecture}",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

}


