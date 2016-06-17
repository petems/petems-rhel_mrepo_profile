# Add Yumrepo for Oracle Linux Mirror
class rhel_mrepo_profiles::yumrepo::rpmforge
(
  $mrepo_master,
)
{

  yumrepo { 'rpmforge':
    baseurl  => "http://${mrepo_master}:${mrepo_port}/rpmforge-${::operatingsystemmajrelease}-${::architecture}/RPMS.all",
    descr    => 'RHEL $releasever - RPMforge.net - dag',
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

}


