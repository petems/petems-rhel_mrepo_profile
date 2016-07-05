# Mirror Oracle Repos
class rhel_mrepo_profiles::repo_mirror::oracle(
  $update_schedule = 'never',
  $download_isos = false,
  $protocol = 'http',
  $oracle_6_update = 'U7',
  $oracle_7_update = 'U2',
)
{

  require ::rhel_mrepo_profiles

  $mirror_root    = $rhel_mrepo_profiles::mirror_root

  $oracle_6_iso    = "http://ftp.linux.org.uk/pub/distributions/EnterpriseLinux/OL6/${oracle_6_update}/x86_64"

  # Oracle 7 Mirror uses lowercase update string
  $oracle_7_update_lower = downcase($oracle_7_update)

  $oracle_7_iso    = "http://ftp.linux.org.uk/pub/distributions/EnterpriseLinux/OL7/${oracle_7_update_lower}/x86_64"
  $oracle_mirror   = 'public-yum.oracle.com'

  $ol6_repo_url         = "reposync://${oracle_mirror}/repo/OracleLinux/OL6/\$release/\$repo/\$arch/"
  $ol6_uek_repo_url     = "reposync://${oracle_mirror}/repo/OracleLinux/OL6/UEK/latest/\$arch/"
  $ol7_repo_url         = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/\$repo/latest/\$arch/"
  $ol7_latest_repo_url  = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/latest/\$arch/"
  $ol7_uek_repo_url     = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/UEKR4/\$arch/"

  ##############################################################################
  # Latest Oracle Linux mirrors
  ##############################################################################

  $oracle6latest_iso_x86_64 = "OracleLinux-R6-${oracle_6_update}-Server-x86_64-dvd.iso"
  $oracle7latest_iso_x86_64 = "OracleLinux-R7-${oracle_7_update}-Server-x86_64-dvd.iso"

  ##############################################################################
  # Oracle Linux 7
  ##############################################################################

  if $download_isos {
    mrepo::iso { $oracle7latest_iso_x86_64:
      source_url => $oracle_7_iso,
      repo       => 'oracle7latestserver-x86_64';
    }
  }

  mrepo::repo { 'oracle7latestserver-x86_64':
    ensure    => present,
    repotitle => 'Oracle Linux $release ($arch) LATEST',
    arch      => 'x86_64',
    release   => '7',
    update    => $update_schedule,
    iso       => $oracle7latest_iso_x86_64,
    urls      => {
      latest   => $ol7_latest_repo_url,
      uek      => $ol7_uek_repo_url,
      optional => $ol7_repo_url,
    },
  }

  ##############################################################################
  # Oracle Linux 6
  ##############################################################################

  if $download_isos {
    mrepo::iso { $oracle6latest_iso_x86_64:
      source_url => $oracle_6_iso,
      repo       => 'oracle6latestserver-x86_64';
    }
  }

  mrepo::repo { 'oracle6latestserver-x86_64':
    ensure    => present,
    repotitle => 'Oracle Linux 6 ($arch) LATEST',
    arch      => 'x86_64',
    release   => '6',
    iso       => $oracle6latest_iso_x86_64,
    update    => $update_schedule,
    urls      => {
      base => $ol6_repo_url,
      uek  => $ol6_uek_repo_url,
    },
  }

}
