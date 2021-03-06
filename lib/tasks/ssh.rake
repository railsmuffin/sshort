desc 'Starts SSH connection to a remote server.'
task :ssh do
  servers = []
  on roles (ENV['ROLE'] || :app).to_sym do |server|
    servers << server
  end

  puts 'Available servers:'
  servers.each_with_index { |server, i| puts "  #{i + 1}. #{server.hostname}" }

  set :server, ask(:server, '1')
  if servers.count == 1 || !(1..servers.count).include?(fetch(:server).to_i)
    current_server = servers.first
  else
    current_server = servers[fetch(:server).to_i - 1]
  end

  puts "Connecting to #{current_server.hostname}..."
  port = current_server.port || fetch(:ssh_options, {})[:port] || 22
  ssh_command = "ssh -p #{port} #{current_server.user}@#{current_server.hostname}"
  cd_command = "cd #{fetch(:deploy_to)} && bash"
  system "#{ssh_command} -t \"#{cd_command}\""
end
