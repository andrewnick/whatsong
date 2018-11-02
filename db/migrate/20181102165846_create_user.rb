class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :spotify_hash
      t.timestamps null: false
    end
  end
end