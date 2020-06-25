class AddPhototoOffices < ActiveRecord::Migration[6.0]
  def change
    add_column :offices, :photo, :string
  end
end
