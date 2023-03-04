import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_tdd/presentation/screens/weather/widgets/table_row.dart';
import '../../../core/consts/consts.dart';
import '../../bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb5d9e6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    onTapOutside: (event)=>FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                      fillColor: const Color(0xffF3F3F3),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onChanged: (query) {
                      context
                          .read<WeatherBloc>()
                          .add(OnCityChangedEvent(query));
                    },
                  ),
                  const SizedBox(height: 32.0),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherEmpty) {
                        return Center(
                          child: Container(
                            child: Center(
                                child: Lottie.asset(ASSETS.WEATHERLOTTIE)),
                          ),
                        );
                      }
                      if (state is WeatherLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is WeatherLoaded) {
                        return Column(
                          key: const Key('weather_data'),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.result.cityName,
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                                Image(
                                  image: NetworkImage(
                                    URLS.weatherIcon(
                                      state.result.iconCode,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${state.result.main} | ${state.result.description}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            Table(
                              defaultColumnWidth: const FixedColumnWidth(150.0),
                              border: TableBorder.all(
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              children: [
                                WeatherTableRow("Temperature",
                                    state.result.temperature.toString()),
                                WeatherTableRow("Pressure",
                                    state.result.pressure.toString()),
                                WeatherTableRow("Humidity",
                                    state.result.humidity.toString()),
                              ],
                            ),
                          ],
                        );
                      }
                      if (state is WeatherFailure) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
