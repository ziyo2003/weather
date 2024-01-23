import 'package:new_api_project/core/either/either.dart';
import 'package:new_api_project/core/failure/failure.dart';
import 'package:new_api_project/core/useCase/useCase.dart';
import 'package:new_api_project/features/home/data/repository/repository.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';

class GetDataUseCase implements UseCase<List<WeatherEntity>, WeatherParams> {
  final WeatherRepositoryImpl weatherRepositoryImpl;

  GetDataUseCase({required this.weatherRepositoryImpl});

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(param) {
    return weatherRepositoryImpl.getDatas();
  }
}

class WeatherParams {}
