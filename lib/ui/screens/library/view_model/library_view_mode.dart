import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';

class LibraryViewMode extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState settingsState;

  LibraryViewMode({
    required this.songRepository,
    required this.playerState,
    required this.settingsState,
  });
}