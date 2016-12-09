class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_id
      t.string :name
      t.boolean :studio

      t.timestamps
    end
    add_index :albums, :band_id
  end
end
