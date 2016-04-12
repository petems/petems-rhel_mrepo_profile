# Mirror Oracle Repos
class rhel_mrepo_profiles::repo_mirror::oracle(
  $download_isos = false,
)
{

  require rhel_mrepo_profiles

  $mirror_root    = $rhel_mrepo_profiles::mirror_root

  $oracle_6_iso    = 'http://ftp.linux.org.uk/pub/distributions/oracle/OL6/U7/x86_64'
  $oracle_7_iso    = 'http://ftp.linux.org.uk/pub/distributions/enterprise/OL7/u2/x86_64'
  $oracle_mirror   = 'public-yum.oracle.com'

  $staging_target       = "${mirror_root}/iso"

  file { $staging_target:
    ensure => directory,
    owner  => apache,
    group  => apache,
    mode   => '0755',
  }

  $ol6_repo_url         = "reposync://${oracle_mirror}/repo/OracleLinux/OL6/\$release/\$repo/\$arch/"
  $ol6_uek_repo_url     = "reposync://${oracle_mirror}/repo/OracleLinux/OL6/UEK/latest/\$arch/"
  $ol7_repo_url         = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/\$repo/latest/\$arch/"
  $ol7_latest_repo_url  = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/latest/\$arch/"
  $ol7_uek_repo_url     = "reposync://${oracle_mirror}/repo/OracleLinux/OL7/UEKR4/\$arch/"

  ##############################################################################
  # Latest Oracle Linux mirrors
  ##############################################################################

  $oracle6latest_iso_x86_64 = 'OracleLinux-R6-U7-Server-x86_64-dvd.iso'
  $oracle7latest_iso_x86_64 = 'OracleLinux-R7-U2-Server-x86_64-dvd.iso'

  ##############################################################################
  # Oracle Linux 7
  ##############################################################################

  if $download_isos {
    mrepo::iso { $oracle7latest_iso_x86_64:
      source_url => "${oracle_7_iso}/iso",
      repo       => 'oracle7latestserver-x86_64';
    }
  }

  mrepo::repo { 'oracle7latestserver-x86_64':
    ensure    => present,
    repotitle => 'Oracle Linux $release ($arch) LATEST',
    arch      => 'x86_64',
    release   => '7',
    update    => 'weekly',
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
      source_url => "${oracle_6_iso}/iso",
      repo       => 'oracle6latestserver-x86_64';
    }
  }

  mrepo::repo { 'oracle6latestserver-x86_64':
    ensure    => present,
    repotitle => 'Oracle Linux 6 ($arch) LATEST',
    arch      => 'x86_64',
    release   => '7',
    iso       => $oracle6latest_iso_x86_64,
    hour      => '3',
    urls      => {
      base => $ol6_repo_url,
      uek  => $ol6_uek_repo_url,
    },
  }

}
