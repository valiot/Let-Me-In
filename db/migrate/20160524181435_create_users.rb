class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :name
      t.string :email
      t.string :image_url
      t.integer :role, default: 0
      t.integer :shirt_size, default: 1

      t.timestamps
    end
  end
end
