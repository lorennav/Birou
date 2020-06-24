class AddForeignKeyToOffices < ActiveRecord::Migration[6.0]
  def change
    add_reference :offices, :user, foreign_key: true
  end
end
