import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';
import '../library/view_model/library_view_mode.dart';
import '../library/widgets/library_content.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late final LibraryViewMode _viewMode;
  @override
  void initState() {
    super.initState();
    
    final songRepository = context.read<SongRepository>();
    final playerState = context.read<PlayerState>();
    final settingsState = context.read<AppSettingsState>();
    
    _viewMode = LibraryViewMode(
      songRepository: songRepository,
      playerState: playerState,
      settingsState: settingsState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LibraryContent(viewMode: _viewMode);
  }
}

