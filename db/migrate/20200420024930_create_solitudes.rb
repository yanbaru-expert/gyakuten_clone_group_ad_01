class CreateSolitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :solitudes do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
