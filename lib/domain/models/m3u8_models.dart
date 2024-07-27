class Channel {
  final String tvgId;
  final String tvgLogo;
  final String groupTitle;
  final String name;
  final String url;

  Channel({
    required this.tvgId,
    required this.tvgLogo,
    required this.groupTitle,
    required this.name,
    required this.url,
  });

  factory Channel.fromM3U8(String extinf, String url) {
    final tvgId = _extractAttribute(extinf, 'tvg-id');
    final tvgLogo = _extractAttribute(extinf, 'tvg-logo');
    final groupTitle = _extractAttribute(extinf, 'group-title');
    final name = extinf.split(',').last.trim();

    return Channel(
      tvgId: tvgId ?? '',
      tvgLogo: tvgLogo ?? '',
      groupTitle: groupTitle ?? '',
      name: name,
      url: url,
    );
  }

  static String? _extractAttribute(String extinf, String attribute) {
    final regex = RegExp('$attribute="([^"]*)"');
    final match = regex.firstMatch(extinf);
    return match?.group(1);
  }

  Map<String, dynamic> toJson() {
    return {
      'tvgId': tvgId,
      'tvgLogo': tvgLogo,
      'groupTitle': groupTitle,
      'name': name,
      'url': url,
    };
  }

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      tvgId: json['tvgId'] ?? '',
      tvgLogo: json['tvgLogo'] ?? '',
      groupTitle: json['groupTitle'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  @override
  String toString() {
    return "Channel Name: $name";
  }
}
