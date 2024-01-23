part of 'weather_bloc.dart';

class WeatherState {
  final List<WeatherEntity> all;
  final Status status;

  WeatherState({required this.all, required this.status});

  WeatherState copyWith({
    List<WeatherEntity>? all,
    Status? status,
  }) {
    return WeatherState(
      all: all ?? this.all,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(covariant WeatherState other) {
    if (identical(this, other)) return true;

    return listEquals(other.all, all) && other.status == status;
  }

  @override
  int get hashCode => all.hashCode ^ status.hashCode;

  @override
  String toString() => 'WeatherState(all: $all, status: $status)';
}
