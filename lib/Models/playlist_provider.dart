import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:jc_music_app_flutter/Models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    // Maze
    Song(
        songName: "迷宫",
        artistName: "step.jad",
        albumArtImagePath: "assets/images/Maze.png",
        audioPath: "audio/Maze.mp3"),

    Song(
        songName: "别问很可怕",
        artistName: "J.Sheon",
        albumArtImagePath: "assets/images/Dont_ask.jpg",
        audioPath: "audio/Dont_ask.mp3"),

    Song(
      songName: "最后一页",
      artistName: "Wang Heye & Yao Xiaotang",
      albumArtImagePath: "assets/images/Last_page.jpeg",
      audioPath: "audio/Last_page.mp3",
    ),

    Song(
      songName: "妥協",
      artistName: "Baby Zhang & Yao Xiaotang",
      albumArtImagePath: "assets/images/Compromise.jpg",
      audioPath: "audio/Compromise.mp3",
    ),
    Song(
      songName: "如果爱忘了",
      artistName: "Silence Wang & Zhang Bichen",
      albumArtImagePath: "assets/images/If_love_forgets.jpg",
      audioPath: "audio/If_love_forgets.mp3",
    ),

    Song(
      songName: "见与不见",
      artistName: "Zhang Bichen",
      albumArtImagePath: "assets/images/Meet_not_meet.jpeg",
      audioPath: "audio/Meet_not_meet.mp3",
    ),

    Song(
      songName: "字字句句",
      artistName: "盧盧快閉嘴",
      albumArtImagePath: "assets/images/Words_and_sentences.jpeg",
      audioPath: "audio/Words_and_sentences.mp3",
    ),

    Song(
      songName: "友谊长存",
      artistName: "Firdhaus",
      albumArtImagePath: "assets/images/Longlast_friendship.jpg",
      audioPath: "audio/Longlast_friendship.mp3",
    ),
  ];

  // current Song Index
  int? _currentSongIndex;

  /*

  A U D I O P L A Y E R

   */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }
  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!]!.audioPath;
    await _audioPlayer.stop(); // Stop Current Song

    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause(); // Call Pause Function
    } else {
      resume(); // Call Resume Function
    }
  }

  // seek to specific position in current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // Go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    // If more than 2 seconds has passed restart the current song
    if (_currentDuration.inSeconds > 2) {
      // Restart
      seek(Duration.zero);
    } else {
      // If it's within the 2 seconds go back to previous song
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // If it's the first song go to the last index
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // Listen to total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong(); // Play the next song after completion
    });
  }

  // dispose audio player

  /*

  G E T T E R S

   */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*

  S E T T E R S

   */

  set currentSongIndex(int? newIndex) {
    // Update Current Song Index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // Play song at new index
    }

    // Update UI
    notifyListeners();
  }
}
