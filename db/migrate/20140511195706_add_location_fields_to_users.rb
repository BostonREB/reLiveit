class AddLocationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mailer, :boolean, null: false, default: false
    add_column :users, :zip, :string
  end
end
