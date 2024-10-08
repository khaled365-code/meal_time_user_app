import 'Location.dart';
import 'Viewport.dart';

/// location : {"lat":31.0681301,"lng":31.408514}
/// location_type : "GEOMETRIC_CENTER"
/// viewport : {"northeast":{"lat":31.0694790802915,"lng":31.4098629802915},"southwest":{"lat":31.0667811197085,"lng":31.4071650197085}}

class Geometry {
  Geometry({
      this.location, 
      this.locationType, 
      this.viewport,});

  Geometry.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    locationType = json['location_type'];
    viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Location? location;
  String? locationType;
  Viewport? viewport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['location_type'] = locationType;
    if (viewport != null) {
      map['viewport'] = viewport?.toJson();
    }
    return map;
  }

}