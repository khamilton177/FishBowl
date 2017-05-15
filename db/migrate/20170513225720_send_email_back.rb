class SendEmailBack < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :email
    end
    change_table :profiles do |t|
      t.string :email
    end
  end
end
