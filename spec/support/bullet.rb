RSpec.configure do |config|
  config.before(:each) do
    Bullet.start_request if defined?(Bullet)
  end

  config.after(:each) do
    if defined?(Bullet)
      Bullet.perform_out_of_channel_notifications if Bullet.notification?
      Bullet.end_request
    end
  end
end
