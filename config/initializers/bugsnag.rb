if Rails.env.production?
  Bugsnag.configure do |config|
    config.api_key = "2ca985e62bb5e229708e293cbd6719e1"
  end
end
