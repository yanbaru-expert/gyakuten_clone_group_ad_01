if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      provider: 'AWS',
      region: 'ap-northeast-1',
      aws_access_key_id:  'AKIAWYHIWN7UROT75V4P',
      aws_secret_access_key:  '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'
    }
    config.fog_directory     =  ENV['gyakuten-salon-ad-01-bucket']
  end
end
