
enum Country {
  Afghanistan,
  Albania,
  Algeria,
  AmericanSamoa,
  Andorra,
  Angola,
  Anguilla,
  AntiguaAndBarbuda,
  Argentina,
  Armenia,
  Aruba,
  Australia,
  Austria,
  Azerbaijan,
  Bahamas,
  Bahrain,
  Bangladesh,
}

extension CountryUrl on Country {
  String get url {
    switch (this) {
      case Country.Afghanistan:
        return 'https://iptv-org.github.io/iptv/countries/af.m3u';
      case Country.Albania:
        return 'https://iptv-org.github.io/iptv/countries/al.m3u';
      case Country.Algeria:
        return 'https://iptv-org.github.io/iptv/countries/dz.m3u';
      case Country.AmericanSamoa:
        return 'https://iptv-org.github.io/iptv/countries/as.m3u';
      case Country.Andorra:
        return 'https://iptv-org.github.io/iptv/countries/ad.m3u';
      case Country.Angola:
        return 'https://iptv-org.github.io/iptv/countries/ao.m3u';
      case Country.Anguilla:
        return 'https://iptv-org.github.io/iptv/countries/ai.m3u';
      case Country.AntiguaAndBarbuda:
        return 'https://iptv-org.github.io/iptv/countries/ag.m3u';
      case Country.Argentina:
        return 'https://iptv-org.github.io/iptv/countries/ar.m3u';
      case Country.Armenia:
        return 'https://iptv-org.github.io/iptv/countries/am.m3u';
      case Country.Aruba:
        return 'https://iptv-org.github.io/iptv/countries/aw.m3u';
      case Country.Australia:
        return 'https://iptv-org.github.io/iptv/countries/au.m3u';
      case Country.Austria:
        return 'https://iptv-org.github.io/iptv/countries/at.m3u';
      case Country.Azerbaijan:
        return 'https://iptv-org.github.io/iptv/countries/az.m3u';
      case Country.Bahamas:
        return 'https://iptv-org.github.io/iptv/countries/bs.m3u';
      case Country.Bahrain:
        return 'https://iptv-org.github.io/iptv/countries/bh.m3u';
      case Country.Bangladesh:
        return 'https://iptv-org.github.io/iptv/countries/bd.m3u';
      default:
        return '';
    }
  }
}
