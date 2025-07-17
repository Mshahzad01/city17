import 'package:city17/config/dark_theme.dart';
import 'package:city17/config/ongenerated_route.dart';
import 'package:city17/src/feature/home/cubit/home_cubit.dart';
import 'package:city17/src/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => HomeCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRoute.onGenerateRoute,

        theme: DarkTheme.theme,

        initialRoute: SplashScreen.routename,
      ),
    );
  }
}
