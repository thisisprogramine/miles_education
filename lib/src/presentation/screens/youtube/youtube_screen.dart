
import 'package:flutter/material.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';
import 'package:miles_education/src/presentation/widget/background_grid.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../argument/youtube_argument.dart';
import '../../widget/youtube_app_bar.dart';

class YoutubeScreen extends StatefulWidget {
  final YoutubeArgument argument;
  const YoutubeScreen({super.key, required this.argument});

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.argument.youtubeUrl ?? '') ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: orientation == Orientation.landscape ? null : YoutubeAppBar(title: widget.argument.title),
          body: BackgroundGrid(
            child: Stack(
              children: [
                Center(
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: AppColor.primary,
                      handleColor: AppColor.primary,
                    ),
                    onReady: () {
                      _controller.addListener(listener);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}