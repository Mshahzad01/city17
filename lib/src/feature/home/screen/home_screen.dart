import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/widgets/add_business_bsheet.dart';
import 'package:city17/src/feature/home/widgets/incom_forcast.dart';
import 'package:city17/src/feature/home/widgets/mange_business.dart';
import 'package:city17/src/feature/home/widgets/panding_acction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              padding: const EdgeInsets.only(left: 15, right: 15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IncomForcast(),
                  const SizedBox(height: 10),

                  Text('Panding Action', style: context.myTextTheme.titleLarge),

                  const PandingAcction(),

                  const SizedBox(height: 10),
                  Text(
                    'Manage Business',
                    style: context.myTextTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  const MangeBusiness(),

                  InkWell(
                    onTap: () {
                      showmodelbottomshett(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        color: AppColors.secondarycolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Add a display location',
                            style: context.myTextTheme.titleMedium,
                          ),

                          const SizedBox(width: 10),

                          SvgPicture.asset(
                            AssetString.addoutline,
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
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
