class AddPreRegisterToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :pre_register, :boolean, default: false
  end
end
