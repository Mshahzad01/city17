import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/enum/bottom_bar_enum.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:city17/src/feature/finance/screen/finance_screen.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:city17/src/feature/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';

import '../../advert_offer/screen/advert_offer_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const rotename = '/bottomnav';

  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  BottomBarEnum sletedvalue = BottomBarEnum.home;

  final _pages = [
    const HomeScreen(),
    const AdvertOfferScreen(),
    const FinanceScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(myPadding / 2),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: myPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: currentLoginInfo?.user.profilePic != null
                          ? NetworkImage(currentLoginInfo!.user.profilePic)
                          : null,
                      radius: 18,
                    ),

                    const SizedBox(width: myPadding),

                    Text(
                      currentLoginInfo!.user.name.length > 20 ? '${currentLoginInfo?.user.name.substring(0, 20)}...' : 'name',
                      overflow: TextOverflow.ellipsis,
                      style: context.myTextTheme.titleSmall?.copyWith(
                        color: AppColors.primaryTextcolor,
                        fontSize: 14,
                      ),
                    ),

                   const Spacer(),

           
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                   
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 02),
                  height: .5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      99,
                      90,
                      90,
                    ).withValues(alpha: 0.1),
                    boxShadow: [const BoxShadow(blurRadius: 03)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: IndexedStack(index: selectedIndex, children: _pages),

      //Center(child: Text),
      bottomNavigationBar: Container(
        color: AppColors.bottombarcolor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: BottomBarEnum.values.map((e) {
            final isSelected = e == sletedvalue;
            return InkWell(
              onTap: () {
                setState(() {
                  sletedvalue = e;
                  selectedIndex = e.indexx;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(07),
                ),
                child: Text(
                  e.title,
                  style: context.myTextTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.primaryTextcolor,
                  ),
                ),
              ),
            );
          }).toList(),

          // List.generate(items.length, (index)
        ),
      ),
    );
  }
}
