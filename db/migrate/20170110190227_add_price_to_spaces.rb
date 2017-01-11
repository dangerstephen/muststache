class AddPriceToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :price, :integer
  end
end
