import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_package/bloc/weather_bloc.dart';
import 'package:weather_package/bloc/weather_state.dart';

class DailyMessage extends StatefulWidget {
  const DailyMessage({super.key});

  @override
  State<DailyMessage> createState() => _DailyMessageState();
}

class _DailyMessageState extends State<DailyMessage> {
  late TextStyle? bodyL = Theme.of(context).textTheme.bodyLarge;
  late TextStyle? headM = Theme.of(context).textTheme.headlineMedium;
  late TextStyle? headL = Theme.of(context).textTheme.headlineLarge;
  late TextStyle? headS = Theme.of(context).textTheme.headlineSmall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Today ", style: headL)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              SizedBox(height: 10),
              Text('Weather for today ', style: headL),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoaded) {
                    // C'est ici que tu affiches ta météo (ex: dans un _listMessage)
                    return Text(
                      "${state.weather.temperature}°C - ${state.weather.sunny}",
                    );
                  }
                  // Pour Loading, Initial, Error... on n'affiche rien (ou un petit truc discret)
                  return SizedBox.shrink();
                },
              ),
              SizedBox(height: 10),

              Text('Message ', style: headL),

              SizedBox(height: 10),

              Text("Today your family want to say you that they love you !"),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Bouton rouge
                  Icon(Icons.favorite, size: 50, color: Colors.red),
                  // Bouton bleu
                  Icon(Icons.favorite, size: 50, color: Colors.blue),
                  // Bouton vert
                  Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.lightGreenAccent,
                  ),
                  // Bouton jaune
                  Icon(Icons.favorite, size: 50, color: Colors.yellow),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
