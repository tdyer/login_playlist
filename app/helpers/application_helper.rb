module ApplicationHelper
  def show_playlist(playlist)
    "<tr>
      <td>#{link_to playlist.name, playlist_path(playlist)}</td>
      <td>#{playlist.user.email}</td>
      <td>#{playlist.state}</td>
      <td>#{link_to 'Destroy', playlist, method: :delete, data: { confirm: 'Are you sure?' } }</td>
    </tr>".html_safe
  end

def show_playlists(all_playlists)
  all_lists = ""
  all_playlists.each do |playlist|
    all_lists << show_playlist(playlist)
  end
  all_lists
end

  def show_playlists_table(all_playlists)
    "<table>
  <thead>
    <tr>
      <th>Playlist Name</th>
      <th>Playlist Owner</th>
      <th>Playlist State</th>
    </tr>
  </thead>

  <tbody>
   #{show_playlists(all_playlists)}
  </tbody>
</table>".html_safe
  end
end
