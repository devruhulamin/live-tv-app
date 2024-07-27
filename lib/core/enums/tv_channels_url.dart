import 'package:mojo_live_tv/core/constants/urls_constants.dart';

enum TvChannelsEnums {
  animation,
  auto,
  business,
  classic,
  comedy,
  cooking,
  culture,
  documentary,
  education,
  entertainment,
  family,
  general,
  kids,
  legislative,
  lifestyle,
  movies,
  music,
  news,
  outdoor,
  relax,
  religious,
  science,
  series,
  shop,
  sports,
  travel,
  weather,
  undefined,
}

extension TvCategoryUrl on TvChannelsEnums {
  String get getUrl {
    switch (this) {
      case TvChannelsEnums.animation:
        return IptvCategories.animation;
      case TvChannelsEnums.auto:
        return IptvCategories.auto;
      case TvChannelsEnums.business:
        return IptvCategories.business;
      case TvChannelsEnums.classic:
        return IptvCategories.classic;
      case TvChannelsEnums.comedy:
        return IptvCategories.comedy;
      case TvChannelsEnums.cooking:
        return IptvCategories.cooking;
      case TvChannelsEnums.culture:
        return IptvCategories.culture;
      case TvChannelsEnums.documentary:
        return IptvCategories.documentary;
      case TvChannelsEnums.education:
        return IptvCategories.education;
      case TvChannelsEnums.entertainment:
        return IptvCategories.entertainment;
      case TvChannelsEnums.family:
        return IptvCategories.family;
      case TvChannelsEnums.general:
        return IptvCategories.general;
      case TvChannelsEnums.kids:
        return IptvCategories.kids;
      case TvChannelsEnums.legislative:
        return IptvCategories.legislative;
      case TvChannelsEnums.lifestyle:
        return IptvCategories.lifestyle;
      case TvChannelsEnums.movies:
        return IptvCategories.movies;
      case TvChannelsEnums.music:
        return IptvCategories.music;
      case TvChannelsEnums.news:
        return IptvCategories.news;
      case TvChannelsEnums.outdoor:
        return IptvCategories.outdoor;
      case TvChannelsEnums.relax:
        return IptvCategories.relax;
      case TvChannelsEnums.religious:
        return IptvCategories.religious;
      case TvChannelsEnums.science:
        return IptvCategories.science;
      case TvChannelsEnums.series:
        return IptvCategories.series;
      case TvChannelsEnums.shop:
        return IptvCategories.shop;
      case TvChannelsEnums.sports:
        return IptvCategories.sports;
      case TvChannelsEnums.travel:
        return IptvCategories.travel;
      case TvChannelsEnums.weather:
        return IptvCategories.weather;
      case TvChannelsEnums.undefined:
        return IptvCategories.undefined;
    }
  }
}
