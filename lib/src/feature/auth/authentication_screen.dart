import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/alert_utills.dart';
import 'package:city17/src/feature/auth/cubit/auth_cubit.dart';
import 'package:city17/src/feature/home/bottom_nav_bar/bottom_bar_screen.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routename = '/auth';
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void initState() {
    super.initState();

    // _dely();
  }

  Future<void> _dely() async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 02));
    navigator.pushReplacementNamed(BottomNavScreen.rotename);
  }

  List<String> verticalTexts = const [
    'Decentralized Advertisement Network',
    'Dezentrales Werbenetzwerk',
    'وکندریقرت ایڈورٹائزنگ نیٹ ورک',
    'Dezentrales Werbenetzwerk',
    '분산형 광고 네트워크',
    'Децентрализованная рекламная сеть',
    '分散型広告ネットワーク',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,

      body: BlocConsumer<AuthCubit, AuthState>(
        listener: _listener,
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: verticalTexts.map((text) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: text
                            .split('')
                            .map(
                              (char) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0.5,
                                ),
                                child: Text(
                                  char,
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: AppColors.primaryTextcolor
                                            .withValues(alpha: 0.1),

                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }).toList(),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Image.asset(AssetString.logo, height: 60, width: 150),

                    const SizedBox(height: 6),
                    Text(
                      'Display Manager',
                      style: context.myTextTheme.titleLarge?.copyWith(
                        fontSize: 12,
                        color: AppColors.primaryTextcolor.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: myPadding / 1.5,
                        right: myPadding / 1.5,
                      ),

                      child: CustomButton(
                        iconAtStart: true,
                        svgicon: AssetString.google,
                        title: StringData.signInWithGoogle,
                        isLoading: state is AuthLoading && state.google,
                        onPressed: () {
                          context.read<AuthCubit>().signInWithGoogle();
                        },
                      ),
                    ),
                    const SizedBox(height: myPadding),
                    Text(
                      'By proceeding you accept all terms and conditions',
                      style: context.myTextTheme.titleLarge?.copyWith(
                        fontSize: 12,
                        color: AppColors.primaryTextcolor,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            'V1.0 M',
                            style: context.myTextTheme.titleLarge?.copyWith(
                              fontSize: 12,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthAlert) {
      AlertUtils.alert(context, content: state.message);
    }

    if (state is AuthSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routename,
        (route) => false,
      );
    }
  }
}
