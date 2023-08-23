class CreateOrchestra < ActiveRecord::Migration[7.0]
  def change
    create_table :orchestras do |t|
      t.string :name
      t.boolean :auditions_open
      t.integer :year_established

      t.timestamps
    end
  end
end
