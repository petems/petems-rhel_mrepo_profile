# Add Yumrepo for Oracle Linux Mirror
class rhel_mrepo_profiles::yumrepo::oracle
(
  $mrepo_master,
)
{

  yumrepo { 'oracle_linux':
    baseurl  => "http://${mrepo_master}/oracle${::operatingsystemmajrelease}latestserver-${::architecture}/RPMS.all",
    descr    => "Linux ${::operatingsystemmajrelease} ${::architecture}",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

}


