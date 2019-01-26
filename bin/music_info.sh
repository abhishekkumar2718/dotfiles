current_song=$(audtool --current-song)
current_time=$(audtool --current-song-output-length)
song_length=$(audtool --current-song-length)
if [[ -z "$current_song" ]]; then
        echo "No song currently playing!"
else
        echo $current_song [$current_time/$song_length]
fi
