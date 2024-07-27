import 'package:http/http.dart' as http;
import 'package:mojo_live_tv/domain/models/m3u8_models.dart';

class LoadTvChannelFromRemote {
  Future<List<Channel>?> fetchM3U8(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final lines = response.body.split('\n');
        List<Channel>? channels = [];
        String? extinf;

        for (final line in lines) {
          if (line.startsWith('#EXTINF:')) {
            extinf = line;
          } else if (line.startsWith('http') && extinf != null) {
            channels.add(Channel.fromM3U8(extinf, line));
            extinf = null;
          }
        }

        return channels;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error fetching m3u8 file: $e');
    }
  }
}
