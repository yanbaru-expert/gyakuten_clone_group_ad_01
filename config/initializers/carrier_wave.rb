if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
<<<<<<< HEAD
      :provider              => 'AWS',
      :region                => ENV['S3_ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_AKIAQH4RXPRSXRXKXVG3'],
      :aws_secret_access_key => ENV['S3_vYBXn49xQ62hHl9s5Qvbx0ZxRBIlsCawyrW3xYgQ']
    }
    config.fog_directory     =  ENV['S3_healthmanagementapp']
  end
end
=======
      provider: "AWS",
      region: ENV["S3_REGION"],
      aws_access_key_id: ENV["S3_ACCESS_KEY"],
      aws_secret_access_key: ENV["S3_SECRET_KEY"]
    }
    config.fog_directory = ENV["S3_BUCKET"]
  end
end
>>>>>>> 3ae0c64efab9cc7114b416d95d29e0171fac0b59
