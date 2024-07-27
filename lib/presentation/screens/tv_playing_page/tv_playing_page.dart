import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:mojo_live_tv/domain/models/m3u8_models.dart';

class TvPlayingPage extends StatefulWidget {
  final Channel tvCannel;
  final List<Channel> channels;
  const TvPlayingPage({super.key, required this.tvCannel, required this.channels});

  @override
  State<TvPlayingPage> createState() => _TvPlayingPageState();
}

class _TvPlayingPageState extends State<TvPlayingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playing ${widget.tvCannel.name}"),
      ),
      body: Column(
        children: [
          YoYoPlayer(
              aspectRatio: 16 / 9,
              url: widget.tvCannel.url,
              videoStyle: const VideoStyle(
                qualityStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                forwardAndBackwardBtSize: 30.0,
                playButtonIconSize: 40.0,
                playIcon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 40.0,
                  color: Colors.white,
                ),
                pauseIcon: Icon(
                  Icons.remove_circle_outline_outlined,
                  size: 40.0,
                  color: Colors.white,
                ),
                videoQualityPadding: EdgeInsets.all(5.0),
              ),
              videoLoadingStyle: const VideoLoadingStyle(
                loading: Center(
                  child: Text("Loading video"),
                ),
              ),
              allowCacheFile: true,
              onCacheFileCompleted: (files) {
                print('Cached file length ::: ${files?.length}');

                if (files != null && files.isNotEmpty) {
                  for (var file in files) {
                    print('File path ::: ${file.path}');
                  }
                }
              },
              onCacheFileFailed: (error) {
                print('Cache file error ::: $error');
              },
              onFullScreen: (value) {
                setState(() {
                  // if (fullscreen != value) {
                  //   fullscreen = value;
                  // }
                });
              }),
        ],
      ),
    );
  }
}
