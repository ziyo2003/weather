

class Data {
  final Location location;
  final Current current;

  Data({required this.location, required this.current});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzid;
  final int localtimeepoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzid,
    required this.localtimeepoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      tzid: json['tzid'],
      localtimeepoch: json['localtimeepoch'],
      localtime: json['localtime'],
    );
  }
  // @override
  // String toString() {
  //   return 'Location(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzid: $tzid, localtimeepoch: $localtimeepoch)';
  // }
}

class Current {
  final String lastUpdated;
  final double tempc;
  final int isday;
  final Condition condition;
  final double windkph;
  final int humidity;
  final int cloud;

  Current({
    required this.lastUpdated,
    required this.tempc,
    required this.isday,
    required this.condition,
    required this.windkph,
    required this.humidity,
    required this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdated: json['last_updated'],
      tempc: json['tempc'].toDouble(),
      isday: json['isday'],
      condition: Condition.fromJson(json['condition']),
      windkph: json['windkph'].toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
    );
  }
  // @override
  // String toString() {
  //   return 'Current(lastUpdated: $lastUpdated, tempc: $tempc, isday: $isday, condition: $condition, windkph: $windkph, cloud: $cloud, humidity: $humidity)';
  // }
}

class Condition {
  final String text;

  Condition({required this.text});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
    );
  }
}
