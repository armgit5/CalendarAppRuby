CarrierWave.configure do |config|
  config.fog_credentials = {
#    :provider               => 'AWS',
#    :aws_access_key_id      => 'AKIAIQHRF3LQ5RRMHIDQ',
#    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'test-nilpeter' # bucket name
end