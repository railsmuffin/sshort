desc 'Starts SSH connection to a remote server.'
task :ssh do
  on roles((ENV['ROLE'] || :app).to_sym) do |server|
    ssh_command = "ssh -p #{server.port || 22} #{server.user}@#{server.hostname}"
    cd_command = "cd #{fetch(:deploy_to)}/current && bash"
    system "#{ssh_command} -t \"#{cd_command}\""
  end
end
