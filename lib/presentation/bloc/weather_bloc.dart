import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather.dart';
part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {
  
  final GetWeatherUseCase _getWeatherUseCase;
  WeatherBloc(this._getWeatherUseCase) : super(WeatherEmpty()) {
    on<OnCityChangedEvent>(
      (event, emit) async {

        emit(WeatherLoading());
        final result = await _getWeatherUseCase.execute(event.cityName);
        result.fold(
          (failure) {
            emit(WeatherFailure(failure.message));
          },
          (data) {
            emit(WeatherLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }