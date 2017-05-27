require 'spec_helper'
describe 'csf::allow', :type => :define do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        let :title do
          '10.12.34.56'
        end

        context "csf::allow with parameters" do
          let(:params) {{
            :comment => 'foobar',
          }}

          it { is_expected.to contain_csf__global('csf-global-allow-10.12.34.56').with('ensure' => 'present') }
          it { is_expected.to contain_csf__global('csf-global-allow-10.12.34.56').with('comment' => 'foobar') }
          it { is_expected.to contain_csf__global('csf-global-allow-10.12.34.56').with('type' => 'allow') }
          it { is_expected.to contain_csf__global('csf-global-allow-10.12.34.56').with('ipaddress' => '10.12.34.56') }

          it { is_expected.to contain_file_line('csf-10.12.34.56-allow') }
        end
      end
    end 
  end
end
