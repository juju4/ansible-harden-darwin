require 'serverspec'

# Required by serverspec
set :backend, :exec

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  it { should contain 'PasswordAuthentication no' }
  it { should contain 'PermitRootLogin without-password' }
end
