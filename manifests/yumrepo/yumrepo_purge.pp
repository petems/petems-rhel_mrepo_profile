# Purge all yumrepos
class rhel_mrepo_profiles::yumrepo::yumrepo_purge
(
  $mrepo_master,
  $noop  = true,
)
{

  resources { 'yumrepo':
    purge => true,
    noop  => $noop,
  }

}


