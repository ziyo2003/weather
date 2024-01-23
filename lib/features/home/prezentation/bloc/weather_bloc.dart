import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_api_project/core/data_status/status.dart';
import 'package:new_api_project/features/home/data/data_source/data_source.dart';
import 'package:new_api_project/features/home/data/repository/repository.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';
import 'package:new_api_project/features/home/domain/useCase/useCase.dart';
import 'package:flutter/foundation.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(): super(WeatherState(
          all: [],
          status: Status.pure,
        )) {
    on<getDatas>(
      (event, emit) async {
        emit(state.copyWith(status: Status.loading));
        final useCase = GetDataUseCase(
          weatherRepositoryImpl: WeatherRepositoryImpl(
            dataSource: DataSource(),
          ),
        );
        final either = await useCase.call(WeatherParams());
        either.either((failure) {
          emit(state.copyWith(status: Status.failure));
        }, (value) {
          emit(state.copyWith(all: value, status: Status.success));
        });
      },
    );
  }
}
