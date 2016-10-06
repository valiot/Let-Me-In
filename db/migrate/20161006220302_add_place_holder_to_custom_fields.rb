class AddPlaceHolderToCustomFields < ActiveRecord::Migration[5.0]
  def change
    add_column :custom_fields, :placeholder, :string
  end
end
