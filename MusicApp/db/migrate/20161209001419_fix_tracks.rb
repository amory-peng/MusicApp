class FixTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :lyrics
    add_column :tracks, :lyrics, :text
  end
end
