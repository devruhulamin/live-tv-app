import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:mojo_live_tv/domain/models/m3u8_models.dart';
import 'package:mojo_live_tv/presentation/screens/tv_playing_page/tv_playing_page.dart';

class ChannelsGridView extends StatelessWidget {
  final List<Channel> channels;
  const ChannelsGridView({super.key, required this.channels});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: AnimationLimiter(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisExtent: 140),
                itemCount: channels.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: 2,
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        delay: const Duration(milliseconds: 100),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TvPlayingPage(
                                  tvCannel: channels[index],
                                  channels: channels,
                                ),
                              ));
                            },
                            child: listItem(
                              channels[index],
                            )),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}

Widget listItem(Channel channel) {
  return Card(
      color: Colors.grey[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(8),
            child: CachedNetworkImage(
              imageUrl: channel.tvgLogo,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Expanded(
            child: Text(
              channel.name.split('(')[0],
              style: const TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ));
}
