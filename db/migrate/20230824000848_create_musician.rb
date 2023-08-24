class CreateMusician < ActiveRecord::Migration[7.0]
  def change
    create_table :musicians do |t|
      t.string :name
      t.boolean :full_time
      t.integer :years_involved

      t.timestamps
    end
  end
end
