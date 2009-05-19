# Install hook code here
require 'fileutils'

plugin_root = File.dirname(__FILE__)

# config files
for file in config = %w{ netflix_credentials.yml } do
  FileUtils.cp(File.join(plugin_root, 'config', file), File.join(RAILS_ROOT, 'config'))
end


puts "\n\ninstalled #{ (script + config).join(", ") } \n\n"
