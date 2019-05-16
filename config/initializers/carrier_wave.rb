if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIA4XJXGFOTJ6INZHWI'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['majihoji']
  end
end