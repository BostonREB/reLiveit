class CreateFollowingArtistRelationships < ActiveRecord::Migration
  def change
    create_table :following_artist_relationships do |t|
      t.belongs_to :followed_artist, index: true
      t.belongs_to :follower, index: true

      t.timestamps
    end
  end
end
