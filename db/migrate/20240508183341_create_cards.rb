class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :rarity
      t.string :card_id
      t.string :hp

      t.timestamps
    end

    add_column :cards, :images, :json
  end
end
