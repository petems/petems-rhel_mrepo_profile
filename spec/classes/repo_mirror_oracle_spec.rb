require 'spec_helper'

describe 'rhel_mrepo_profiles::repo_mirror::oracle' do
  context 'supported operating systems' do

    let(:oracle_7_repo_urls) {
      {
        'latest'=>'reposync://public-yum.oracle.com/repo/OracleLinux/OL7/latest/$arch/',
        'uek'=>'reposync://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR4/$arch/',
        'optional'=>'reposync://public-yum.oracle.com/repo/OracleLinux/OL7/$repo/latest/$arch/'
      }
    }

    let(:oracle_6_repo_urls) {
      {
        "base"=>"reposync://public-yum.oracle.com/repo/OracleLinux/OL6/$release/$repo/$arch/",
        "uek"=>"reposync://public-yum.oracle.com/repo/OracleLinux/OL6/UEK/latest/$arch/",
      }
    }

    on_supported_os.each do |os, facts|
      context "on #{os} with no params" do
        let(:facts) do
          facts
        end


        context "rhel_mrepo_profiles::repo_mirror::oracle class without any parameters" do
          it { is_expected.to compile.with_all_deps }
        end

        context "rhel_mrepo_profiles::repo_mirror::oracle should contain mrepo repos" do
          it { should contain_mrepo__repo('oracle7latestserver-x86_64').with_urls(oracle_7_repo_urls) }
          it { should contain_mrepo__repo('oracle6latestserver-x86_64').with_urls(oracle_6_repo_urls) }
        end

        context "doesnt download isos by default" do
          it { should_not contain_mrepo__iso('OracleLinux-R6-U7-Server-x86_64-dvd.iso') }
          it { should_not contain_mrepo__iso('OracleLinux-R7-U2-Server-x86_64-dvd.iso') }
        end
      end

      context "on #{os} with params" do
        let(:facts) do
          facts
        end

        let(:params) {{ 'download_isos' => true }}

        context "rhel_mrepo_profiles::repo_mirror::oracle class without any parameters" do
          it { is_expected.to compile.with_all_deps }
        end

        context "rhel_mrepo_profiles::repo_mirror::oracle should contain mrepo repos" do
          it { should contain_mrepo__iso('OracleLinux-R6-U7-Server-x86_64-dvd.iso') }
          it { should contain_mrepo__iso('OracleLinux-R7-U2-Server-x86_64-dvd.iso') }
          it { should contain_mrepo__repo('oracle7latestserver-x86_64').with_urls(oracle_7_repo_urls) }
          it { should contain_mrepo__repo('oracle6latestserver-x86_64').with_urls(oracle_6_repo_urls) }
        end
      end
    end
  end
end
