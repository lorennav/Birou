class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
