# Mirror CentOS Repos
class rhel_mrepo_profiles::repo_mirror::centos(
  $update_schedule = 'never',
)
{

  require rhel_mrepo_profiles

  $centos_mirror  = 'rsync://mirrors.kernel.org/centos/'
  $vault_mirror   = 'http://mirror.nsc.liu.se/centos-store/'

  $mirror_root    = $rhel_mrepo_profiles::mirror_root

  $repo_url       = "${centos_mirror}/\$release/\$repo/\$arch/"
  $vault_url      = "${vault_mirror}/\$release/\$repo/\$arch/"

  ##############################################################################
  # Latest CentOS mirrors
  ##############################################################################

  $cent6latest    = '6.7'
  $cent7latest    = '7.2.1511'
  $cent7isolatest = '1511'

  $cent6latest_iso_x86_64 = "CentOS-${cent6latest}-x86_64-bin-DVD"

  $cent7latest_iso_x86_64 = "CentOS-7-x86_64-Everything-${cent7isolatest}.iso"

  ##############################################################################
  # CentOS 7.0 ( Latest )
  ##############################################################################

  if $download_isos {
    mrepo::iso { $cent7latest_iso_x86_64:
      source_url => "${centos_mirror}/${cent7latest}/isos/x86_64",
      repo       => 'centos-7-x86_64';
    }
  }

  mrepo::repo { 'centos-7-x86_64':
    ensure    => present,
    repotitle => 'CentOS $release ($arch)',
    arch      => 'x86_64',
    release   => $cent7latest,
    iso       => $cent7latest_iso_x86_64,
    urls      => {
      updates => $repo_url,
      extras  => $repo_url,
    },
  }

  ##############################################################################
  # CentOS 6 Latest
  ##############################################################################

  if $download_isos {
    mrepo::iso {
      "${cent6latest_iso_x86_64}1.iso":
        source_url => "${centos_mirror}/${cent6latest}/isos/x86_64",
        repo       => 'centos-6-x86_64';
      "${cent6latest_iso_x86_64}2.iso":
        source_url => "${centos_mirror}/${cent6latest}/isos/x86_64",
        repo       => 'centos-6-x86_64';
    }
  }

  mrepo::repo { 'centos-6-x86_64':
    ensure    => present,
    repotitle => 'CentOS Linux $release ($arch) LATEST',
    arch      => 'x86_64',
    release   => $cent6latest,
    iso       => "CentOS-${cent6latest}-x86_64-bin-DVD?.iso",
    urls      => {
      os      => $repo_url,
      updates => $repo_url,
    },
  }

  ##############################################################################
  # CentOS static mirrors
  # These mirrors will need to be manually synced once after their generation
  # since they only need to fetch upstream once.
  ##############################################################################

  ##############################################################################
  # CentOS 7.0 Frozen
  ##############################################################################

  $cent70            = '7.0.1406'
  $cent70iso         = '7.0-1406'
  $cent70_iso_x86_64 = "CentOS-${cent70iso}-x86_64-Everything.iso"

  if $download_isos {
    mrepo::iso { $cent70_iso_x86_64:
      source_url => "${vault_mirror}/${cent70}/isos/x86_64",
      repo       => 'cent70server-x86_64';
    }
  }

  mrepo::repo { 'cent70server-x86_64':
    ensure    => present,
    repotitle => 'CentOS $release ($arch)',
    arch      => 'x86_64',
    release   => '7.0.1406',
    update    => 'never',
    iso       => $cent70_iso_x86_64,
    urls      => {
      updates => $vault_url,
      extras  => $vault_url,
    },
  }

}
