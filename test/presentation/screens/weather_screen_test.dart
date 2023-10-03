import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tdd/domain/entities/weather.dart';
import 'package:weather_tdd/presentation/bloc/weather_bloc.dart';
import 'package:weather_tdd/presentation/screens/weather_screen.dart';

interface class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    HttpOverrides.global = null;
  });

  Widget _makeTestWidget(Widget body) {
    return BlocProvider<WeatherBloc>(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const testWeather = WeatherEntity(
    cityName: 'Cairo',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 304.28,
    pressure: 1007,
    humidity: 74,
  );

  testWidgets(
    'text field should trigger state to change from empty to loading, This is a successful test',
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

      //act
      await widgetTester.pumpWidget(_makeTestWidget(const WeatherScreen()));
      var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await widgetTester.enterText(textField, 'Cairo');
      await widgetTester.pump();
      expect(find.text('Cairo'), findsOneWidget);
    },
  );

  testWidgets(
    'should show progress indicator when state is loading, This is a successful test',
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

      //act
      await widgetTester.pumpWidget(_makeTestWidget(const WeatherScreen()));

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain weather data when state is weather loaded, This is a successful test',
    (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state)
          .thenReturn(const WeatherLoaded(testWeather));

      //act
      await widgetTester.pumpWidget(_makeTestWidget(const WeatherScreen()));

      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );
}
