import 'package:dailyfamilymessage/firebase_options.dart';
import 'package:dailyfamilymessage/pages/home.dart';
import 'package:dailyfamilymessage/provider/profil_provider.dart';
import 'package:dailyfamilymessage/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_package/bloc/weather_bloc.dart';
import 'package:weather_package/bloc/weather_event.dart';
import 'package:weather_package/data/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // NotificationService notificationService = NotificationService();
  // await notificationService.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfilProvider()),
        BlocProvider(
          create: (context) =>
              WeatherBloc(WeatherRepository())..add(GetWeatherByGps()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family message',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
