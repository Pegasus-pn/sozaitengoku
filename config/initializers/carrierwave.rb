if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'  #=> 追加
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例（東京）: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIA3UFEEHY7Q7NG5DNT'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['sozaitengoku-sns']
    # キャッシュの保存期間
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end
