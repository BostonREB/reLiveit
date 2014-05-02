class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :identifier
      t.string :date
      t.string :title
      t.belongs_to :artist, index: true

      t.timestamps
    end
  end
end
