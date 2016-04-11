require 'spec_helper'

describe 'rhel_mrepo_profile' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "rhel_mrepo_profile class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('rhel_mrepo_profile::params') }
          it { is_expected.to contain_class('rhel_mrepo_profile::install').that_comes_before('rhel_mrepo_profile::config') }
          it { is_expected.to contain_class('rhel_mrepo_profile::config') }
          it { is_expected.to contain_class('rhel_mrepo_profile::service').that_subscribes_to('rhel_mrepo_profile::config') }

          it { is_expected.to contain_service('rhel_mrepo_profile') }
          it { is_expected.to contain_package('rhel_mrepo_profile').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'rhel_mrepo_profile class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('rhel_mrepo_profile') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
