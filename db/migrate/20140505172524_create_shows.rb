class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.belongs_to :artist, index: true
      t.string :city
      t.string :venue
      t.string :date
      t.string :uri
      t.integer :songkick_id

      t.timestamps
    end
  end
end
