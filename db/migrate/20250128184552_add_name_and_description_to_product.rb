class AddNameAndDescriptionToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :name, :string
    add_column :products, :description, :string
  end
end
