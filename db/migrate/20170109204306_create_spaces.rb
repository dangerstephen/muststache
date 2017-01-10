class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :location
      t.string :size
      t.boolean :available
      t.string :space_type
      t.text :description
      t.float :price
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
