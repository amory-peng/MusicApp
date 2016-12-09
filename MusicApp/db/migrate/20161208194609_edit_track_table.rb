class EditTrackTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :title, :string
  end
end
