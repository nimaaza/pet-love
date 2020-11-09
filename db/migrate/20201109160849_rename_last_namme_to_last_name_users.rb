class RenameLastNammeToLastNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_namme, :last_name
  end
end
