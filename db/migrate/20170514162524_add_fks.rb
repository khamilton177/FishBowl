class AddFks < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.references :post, foreign_key: true
    end
    change_table :profiles do |t|
      t.references :user, foreign_key: true
    end
  end
end
