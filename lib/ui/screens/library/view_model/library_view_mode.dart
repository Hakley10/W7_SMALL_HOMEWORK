import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewMode extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState settingsState;

  List<Song> _songs = [];

  LibraryViewMode({
    required this.songRepository,
    required this.playerState,
    required this.settingsState,
  }) {
    playerState.addListener(_onPlayerStateChanged);
    
    init();
  }

  Future<void> init() async {
    _songs = await songRepository.fetchSongs();
    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  List<Song> get songs => _songs;
  Song? get currentSong => playerState.currentSong;
  AppSettingsState get settings => settingsState;

  void playSong(Song song) {
    playerState.start(song);
  }

  void stopPlayback() {
    playerState.stop();
  }

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

  @override
  void dispose() {
    playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}