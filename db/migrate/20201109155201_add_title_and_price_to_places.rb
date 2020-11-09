class AddTitleAndPriceToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :title, :string
    add_column :places, :price, :integer
  end
end
