class Location {
  Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });
  late final String name;
  late final double lat;
  late final double lon;
  late final String country;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['country'] = country;
    return _data;
  }
}
