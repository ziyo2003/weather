import 'package:flutter/material.dart';
import 'package:new_api_project/core/either/either.dart';
import 'package:new_api_project/core/failure/failure.dart';
import 'package:new_api_project/features/home/data/data_source/data_source.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';
import 'package:new_api_project/features/home/domain/repository/repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final DataSource dataSource;

  WeatherRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<WeatherEntity>>> getDatas() async {
    try {
      final tasks = await dataSource.getData();
      return Right(tasks);
    } catch (e) {
      return Left(
        ServerFailure(message: "error", code: 400),
      );
    }
  }
}
