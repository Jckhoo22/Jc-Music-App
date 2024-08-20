import 'package:flutter/material.dart';
import 'package:jc_music_app_flutter/Components/my_drawer.dart';
import 'package:jc_music_app_flutter/Models/playlist_provider.dart';
import 'package:jc_music_app_flutter/Models/song.dart';
import 'package:jc_music_app_flutter/Pages/song_page.dart';
import 'package:provider/provider.dart';

import '../Themes/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // go to a song
  void goToSong(int songIndex) {
    // update Current Song Index
    playlistProvider.currentSongIndex = songIndex;

    // Navigate to the song
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SongPage()));
  }

  @override
  Widget build(BuildContext context) {

    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("P L A Y L I S T"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        final List<Song> playlist = value.playlist;

        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            // Get Individual Song
            final Song song = playlist[index];

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode ? Colors.black : Colors.grey.shade500,
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      song.albumArtImagePath,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    song.songName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Text(
                    song.artistName,
                  ),
                  onTap: () => goToSong(index),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
