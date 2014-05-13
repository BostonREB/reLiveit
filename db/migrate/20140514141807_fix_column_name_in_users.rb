class FixColumnNameInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :mailer, :gets_email
  end
end
