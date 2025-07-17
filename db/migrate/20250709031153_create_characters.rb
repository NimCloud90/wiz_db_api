class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :role
      t.integer :perstat
      t.integer :agstat
      t.integer :strstat
      t.integer :intstat
      t.integer :chastat

      t.timestamps
    end
  end
end
