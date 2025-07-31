import 'package:city17/config/dark_theme.dart';
import 'package:city17/config/ongenerated_route.dart';
import 'package:city17/firebase_options.dart';
import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:city17/src/feature/auth/cubit/auth_cubit.dart';
import 'package:city17/src/feature/home/bussiness_cubit/bussiness_cubit.dart';
import 'package:city17/src/feature/home/cubit/home_cubit.dart';
import 'package:city17/src/feature/home/forcast_income/cubit/forcast_cubit.dart';
import 'package:city17/src/feature/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SharedPrefUtils.getLoginInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BussinessCubit()),
        BlocProvider(create: (_) => ForcastCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRoute.onGenerateRoute,

        theme: DarkTheme.theme,

        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
