class AddDateColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :songkick_api_date, :string, default: "2014-01-01"
    add_column :users, :lma_api_date, :string, default: "2014-01-01"
  end
end
