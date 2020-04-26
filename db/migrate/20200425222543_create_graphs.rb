class CreateGraphs < ActiveRecord::Migration[6.0]
  def change
    create_table :graphs do |t|
      t.integer :user_id, null: false
      t.date :date, null: false
      t.decimal :temperature, precision: 4, scale: 2, null: false
      t.decimal :weight, precision: 4, scale: 1, null: false
      t.integer :symptom, null: false
      t.text :other
      t.timestamps
    end
    # 一人のユーザーが同じ日付のデータを複数記録できないようにする
    add_index :graphs, %i[user_id date], unique: true
  end
end
