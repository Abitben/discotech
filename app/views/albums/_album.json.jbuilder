json.extract! album, :id, :title, :artist, :year, :price, :created_at, :updated_at
json.url album_url(album, format: :json)
