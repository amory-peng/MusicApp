class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :lyrics
      t.boolean :bonus, default: false

      t.timestamps
    end
  end
end
