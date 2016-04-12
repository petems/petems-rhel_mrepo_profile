class rhel_mrepo_profiles::enable_repo(
  $repo_url,
) {
	Yumrepo {
		enabled => absent,
	}
	yumrepo {
		enabled => true,
		baseurl => "",
		gpgcheck => false,
	}
}
