class DropIdentitiesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :identities
  end
end
