class AddPhotosToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :photos, :json
  end
end
