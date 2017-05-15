class RemoveFks < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.remove :post_id
    end
    change_table :profiles do |t|
      t.remove :user_id
    end
  end
end
