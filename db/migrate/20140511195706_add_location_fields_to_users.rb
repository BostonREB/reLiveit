class AddLocationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mailer, :boolean, default: false
    add_column :users, :zip, :string
  end
end
