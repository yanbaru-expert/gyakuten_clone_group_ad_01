class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  process convert: "jpg"
  process resize_to_limit: [200, 200]

  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # ファイルサイズに制限をつける
  def size_range
    5.megabytes
  end

  # 許可する画像の拡張子
  def extension_white_list
    %w[jpg jpeg gif png]
  end

  # ファイル名を日付にすると編集時のデータ受け渡し等で不具合が出るため、ファイル名をランダムで一意にする
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
