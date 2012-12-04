require "devconf/version"

Rails.logger = Logger.new(STDOUT).tap do |logger|
  # defaults to debug log level for `rails *` commands, app servers and DJ workers
  rails = $0 == 'script/rails'
  worker = $0.end_with?('rake') && ARGV[0] == 'jobs:work'
  server = $0 =~ /(thin|unicorn)\b/

  default_debug = rails || server || worker
  default_level = default_debug ? 'DEBUG' : 'ERROR'

  levels = [ENV['LOG_LEVEL'].to_s.upcase, default_level]
  levels &= %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]
  logger.level = Logger.const_get levels.compact.first
end

# load .env file (copied from foreman's env.rb)
if File.exists?('.env')
  File.read('.env').split("\n").each do |line|
    if line =~ /\A([A-Za-z_0-9]+)=(.*)\z/
      key, value = $1, $2
      case value
      when /\A'(.*)'\z/
        # Remove single quotes
        value = $1
      when /\A"(.*)"\z/
        # Remove double quotes and unescape string preserving newline characters
        value = $1.gsub('\n', "\n").gsub(/\\(.)/, '\1')
      end

      ENV[key] = value
    end
  end
end
