if Rails.env.test? # Store the files locally for test environment
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development? or Rails.env.production? # TODO Use Amazon S3 for Development and Production
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
