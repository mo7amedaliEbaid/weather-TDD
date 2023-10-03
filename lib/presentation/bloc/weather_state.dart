part of 'weather_bloc.dart';


@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity result;

  const WeatherLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class WeatherFailure extends WeatherState {
  final String message;

  const WeatherFailure(this.message);

  @override
  List<Object?> get props => [message];
}