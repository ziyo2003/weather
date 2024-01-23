import 'package:new_api_project/features/home/data/model/model.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';

extension Extension on Data {
  WeatherEntity get toEntity {
    return WeatherEntity(
      name: location.name,
      country: location.country,
      windkph: current.windkph,
      humidity: current.humidity,
      cloud: current.cloud,
    );
  }
}
