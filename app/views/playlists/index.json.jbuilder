json.array!(@playlists) do |playlist|
  json.extract! playlist, :user_id, :name, :state
  json.url playlist_url(playlist, format: :json)
end
