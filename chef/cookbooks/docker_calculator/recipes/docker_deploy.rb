powershell_script 'Install Docker' do
  code <<-EOH
    if (!(Get-Package -Name Docker -ErrorAction SilentlyContinue)) {
      Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
      Install-Package -Name docker -ProviderName DockerMsftProvider -Force
    }
  EOH
end

# Start Docker service
service 'docker' do
  action [:enable, :start]
end

# Pull Docker image
powershell_script 'Pull Docker image' do
  code 'docker pull shishir34878/calculator:latest'
end

# Run Docker container
powershell_script 'Run Docker container' do
  code 'docker run -d --name Calculator shishir34878/calculator:latest'
  not_if 'docker ps -a -q -f name=Calculator'
end
