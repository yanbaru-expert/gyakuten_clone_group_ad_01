class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :date, null: false
      t.string :title, null: false
      t.string :detail, null: false

      t.timestamps
    end
  end
end
