class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :date
      t.string :title
      t.string :detail

      t.timestamps
    end
  end
end
