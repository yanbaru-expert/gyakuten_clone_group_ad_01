solitudes = %w[おはよう こんにちは こんばんは]
solitudes.each do |solitude|
  Solitude.create!(content: solitude)
end
puts '初期データの保存に成功しました!'
