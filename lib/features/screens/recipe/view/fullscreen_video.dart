import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenVideo extends StatefulWidget {
  final String? videoId;
  final String? recipeId;
  final YoutubePlayerController? controller;

  const FullScreenVideo(
      {Key? key, this.videoId, this.recipeId, this.controller})
      : super(key: key);

  @override
  State<FullScreenVideo> createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  late YoutubePlayerController _controller2;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    _controller2 = YoutubePlayerController(
      initialVideoId: widget.videoId!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          showLiveFullscreenButton: false),
    )..addListener(listener);
    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
*/
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller2.value.isFullScreen) {
      setState(() {
        _playerState = _controller2.value.playerState;
        _videoMetaData = _controller2.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller2.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller2.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller2.value.isFullScreen) {
          _controller2.toggleFullScreenMode();
        } else {
          _controller2.pause();
          GetContext.back();
        }

        return false;
      },
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayerBuilder(

              player: YoutubePlayer(
                aspectRatio: 9 / 16,
                controller: _controller2,
              ),
              builder: (context, player) {
                return Container(
                  child: player,
                );
              }),
        ),
      ),
    );
  }
}
