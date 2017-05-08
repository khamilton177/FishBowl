class RenameDob < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :DOB, :dob
  end
end
