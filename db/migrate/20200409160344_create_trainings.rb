class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :image
      t.text :content, null: false
      t.timestamps
    end
  end
end
