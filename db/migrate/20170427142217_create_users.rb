class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password, limit: 16
      t.index :username, unique: true

      t.timestamps
    end
  end
end
