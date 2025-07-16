import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  static const rotename = "/bottomnav";

  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final List<String> items = ['Home', 'Offers', 'Finance', 'Settings'];

  final _pages = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(05),

          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetString.userimage),
                      radius: 18,
                    ),
                    SizedBox(width: 12),

                    Text(
                      "Hi",
                      style: context.myTextTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 04),

                    Text(
                      "Ela",
                      style: context.myTextTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 02),
                  height: .5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      99,
                      90,
                      90,
                    ).withValues(alpha: 0.1),
                    boxShadow: [BoxShadow(blurRadius: 03)],
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
          children: List.generate(items.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
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
                  items[index],
                  style: context.myTextTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.textcolor,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
