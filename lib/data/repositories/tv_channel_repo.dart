import 'dart:developer';

import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';
import 'package:mojo_live_tv/data/data_sources/local/local_db_provider.dart';
import 'package:mojo_live_tv/data/data_sources/remote/load_tv_channel_remote.dart';
import 'package:mojo_live_tv/domain/models/m3u8_models.dart';

class TvChannelRepo {
  final LoadTvChannelFromRemote loadChannelRemote;
  final SharedPreferencesService sharedPreferencesService;

  TvChannelRepo({required this.loadChannelRemote, required this.sharedPreferencesService});

  Future<List<Channel>?> getTvChannel(TvChannelsEnums channelsType) async {
    try {
      final isNeedUpdateChannel = await sharedPreferencesService.isNeedUpdated(channelsType);
      List<Channel>? channelsData;
      print("isneed update $isNeedUpdateChannel");
      if (isNeedUpdateChannel) {
        final result = await loadChannelRemote.fetchM3U8(channelsType.getUrl);
        log("Fetching channels from Remote");
        channelsData = result;
        await sharedPreferencesService.saveChannelsToJson(channels: channelsData ?? [], channelenum: channelsType);
      } else {
        final results = await sharedPreferencesService.getChannelsList(fileName: channelsType);
        if (results == null || results.isEmpty) {
          log("Fetching channels from Remote");
          await sharedPreferencesService.saveChannelsToJson(channels: channelsData ?? [], channelenum: channelsType);
          return await loadChannelRemote.fetchM3U8(channelsType.getUrl);
        }
        log("geeting channels from localdb");
        channelsData = results;
      }
      print(channelsData);
      return channelsData;
    } catch (e, trace) {
      log("error was $e and trace is $trace");
      rethrow;
    }
  }
}
