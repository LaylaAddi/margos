namespace :notification do
  desc "asks drivers to log in to get new load info"
  task sms: :environment do
    puts "sms notification"
  end

end
