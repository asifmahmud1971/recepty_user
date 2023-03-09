import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String mediumId;
  final bool playAble;
  final bool isLocal;

  const MyVideoPlayer({
    Key? key,
    required this.mediumId,
    required this.playAble,
    this.isLocal = true,
  }) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController? _controller;
  bool isPlaying = false;
  bool isLoading = false;
  File? _file;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  _initVideoPlayer() async {
    try {
      if (widget.isLocal) {
        _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
        _controller = VideoPlayerController.file(_file!)
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
            _controller!.addListener(() {
              if (_controller!.value.duration == _controller!.value.position) {
                setState(() {
                  isPlaying = false;
                });
              }
            });
          });
      } else {
        setState(() {
          isLoading = true;
        });
        _controller = VideoPlayerController.network(widget.mediumId)
          ..initialize().then((value) {
            setState(() {
              isLoading = false;
            });
            _controller!.addListener(() {
              if (!_controller!.value.isPlaying &&
                  _controller!.value.isInitialized &&
                  (_controller!.value.duration ==
                      _controller!.value.position)) {
                setState(() {
                  isPlaying = false;
                });
              }
            });
            setState(() {});
          });
      }
    } catch (ex) {
      log(ex.toString());
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      if (mounted) {
        _controller!.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller == null || isLoading
        ? const Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ))
        : _controller!.value.isInitialized
        ? Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 19 / 4,
            child: InkWell(
                onTap: !widget.playAble
                    ? null
                    : () {
                  if (!isPlaying) {
                    setState(() {
                      isPlaying = true;
                    });
                    _controller!.play();
                  } else {
                    setState(() {
                      isPlaying = false;
                    });
                    _controller!.pause();
                  }
                },
                child: Stack(
                  // fit: StackFit.loose,
                  children: [
                    Center(
                      child: AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!)),
                    ),
                    Center(
                      child: isPlaying
                          ? const Icon(
                        Icons.pause,
                        color: Colors.yellow,
                        size: 30,
                      )
                          : const Icon(
                        Icons.play_circle,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    )
        : Container();
  }
}
