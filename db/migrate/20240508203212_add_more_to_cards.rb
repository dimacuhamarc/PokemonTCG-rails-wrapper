class AddMoreToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :rules, :string
    add_column :cards, :attacks, :json
  end
end
