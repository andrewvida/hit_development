class AddPhotoUrlToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo_url, :string, default: 'https://robohash.org/hendrick'
  end
end
