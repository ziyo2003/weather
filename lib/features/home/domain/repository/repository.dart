import 'package:new_api_project/core/either/either.dart';
import 'package:new_api_project/core/failure/failure.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<WeatherEntity>>> getDatas();
}
