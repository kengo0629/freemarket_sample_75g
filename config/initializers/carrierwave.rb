require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAS6CEVI3FITFZWVV3'],
      aws_secret_access_key: ENV['17cc6357a92773937861cf9eae666aa9'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'furima75g'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/furima75g'
  end
end