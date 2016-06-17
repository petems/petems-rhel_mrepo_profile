# Purge all yumrepos
class rhel_mrepo_profiles::yumrepo::yumrepo_purge
(
  $mrepo_master,
  $run_in_noop  = true,
)
{

  resources { 'yumrepo':
    purge => true,
    noop  => $run_in_noop,
  }

}


