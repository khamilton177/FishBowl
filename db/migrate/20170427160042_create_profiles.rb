class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :fname, limit:25
      t.string :lname
      t.datetime :DOB
      t.text :about, limit: 350
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
