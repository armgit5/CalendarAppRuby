CarrierWave.configure do |config|
  config.fog_credentials = {
#    :provider               => 'AWS',
#    :aws_access_key_id      => 'Key',
#    :aws_secret_access_key  => 'Key'
  }
  config.fog_directory  = 'test-nilpeter' # bucket name
end
