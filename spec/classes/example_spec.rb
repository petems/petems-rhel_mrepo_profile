require 'spec_helper'

describe 'rhel_mrepo_profiles' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "rhel_mrepo_profiles class without any parameters" do
          it { is_expected.to compile.with_all_deps }
        end
      end
    end
  end
end
