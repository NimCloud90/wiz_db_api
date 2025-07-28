class AddPlayerToSaves < ActiveRecord::Migration[8.0]
  def change
    add_reference :saves, :player, null: false, foreign_key: true
  end
end
