class AddCollectionToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :collection, :string
  end
end
