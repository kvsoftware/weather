class LocationEntity {
  String name;
  double lat;
  double lon;
  String country;
  String state;

  LocationEntity({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  String getId() => "${lat}_$lon";
}
