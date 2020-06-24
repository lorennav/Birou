class RemovePhotoFromOffices < ActiveRecord::Migration[6.0]
  def change
    remove_column :offices, :photo, :string
  end
end
