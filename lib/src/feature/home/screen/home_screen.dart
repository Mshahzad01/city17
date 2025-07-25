import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/widgets/add_business_bsheet.dart';
import 'package:city17/src/feature/home/widgets/income_forcast.dart';
import 'package:city17/src/feature/home/widgets/mange_business.dart';
import 'package:city17/src/feature/home/widgets/pending_acction.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: myPadding, right: myPadding),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IncomForcast(),
                  const SizedBox(height: myPadding / 2),

                  Text('Panding Action', style: context.myTextTheme.titleLarge),

                  const PandingAcction(),
                  const SizedBox(height: myPadding / 2),
                  Text(
                    'Manage Business',
                    style: context.myTextTheme.titleLarge,
                  ),
                  const SizedBox(height: myPadding / 2),
                  const MangeBusiness(),
                  const SizedBox(height: myPadding / 2),

                  SizedBox(
                    height: 50,
                    child: CustomButton(
                      mixumHeight: 50,
                      title: StringData.addaDisplayLocation,

                      svgicon: AssetString.addoutline,
                      iconcolor: AppColors.primaryTextcolor,
                      onPressed: () {
                        showmodelbottomshett(context);
                      },
                    ),
                  ),

                  const SizedBox(height: myPadding / 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showmodelbottomshett(BuildContext contxt) {
    return showModalBottomSheet(
      context: contxt,
      isScrollControlled: true,
      builder: (innercontext) {
        final bottomPadding = MediaQuery.of(innercontext).viewInsets.bottom;

        return AddBusinessBS(bottompanding: bottomPadding);
      },
    );
  }
}
