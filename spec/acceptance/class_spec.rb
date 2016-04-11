require 'spec_helper_acceptance'

describe 'rhel_mrepo_profile class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'rhel_mrepo_profile': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe package('rhel_mrepo_profile') do
      it { is_expected.to be_installed }
    end

    describe service('rhel_mrepo_profile') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
