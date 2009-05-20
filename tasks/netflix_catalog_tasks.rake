# desc "Explaining what the task does"
# task :netflix_catalog do
#   # Task goes here
# end

ENV['RAILS_ENV'] ||= "development"

namespace :netflix do
  desc "retrieve whole index"
  task :retrieve_index => :environment do
    xml = NetFlix::Request.new(:url => 'http://api.netflix.com/catalog/titles/index').send

    f = File.new(File.join(RAILS_ROOT, "../netflix_catalog/netflix_#{Time.now.to_date.to_s(:db).gsub('-','')}.xml"), 'w')

    f.write xml

    f.close
  end 
end
