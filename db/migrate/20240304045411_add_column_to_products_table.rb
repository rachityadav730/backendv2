class AddColumnToProductsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :rating, :integer
    add_column :products, :main_description, :string
    add_column :products, :img_url, :string
  end
end


