class AddCoverColumnsToAlbums < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :albums, :cover
  end
end
