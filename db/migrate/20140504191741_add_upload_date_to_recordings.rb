class AddUploadDateToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :upload_date, :string
  end
end
