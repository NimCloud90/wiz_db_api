class CreateSaves < ActiveRecord::Migration[8.0]
  def change
    create_table :saves do |t|
      t.string :savename
      t.integer :slot

      t.timestamps
    end
  end
end
