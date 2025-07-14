import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/widgets/incom_forcast.dart';
import 'package:city17/src/feature/home/widgets/mange_business.dart';
import 'package:city17/src/feature/home/widgets/panding_acction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const routename = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IncomForcast(),
                SizedBox(height: 10),

                Text(
                  "Panding Action",
                  style: context.myTextTheme.titleLarge?.copyWith(),
                ),

                PandingAcction(),

                SizedBox(height: 10),
                Text(
                  "Manage Business",
                  style: context.myTextTheme.titleLarge?.copyWith(),
                ),
                SizedBox(height: 10),
                MangeBusiness(),

                InkWell(
                  onTap: () {
                    showmodelbottomshett(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: AppColors.cardcolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "Add a display location",
                          style: context.myTextTheme.titleMedium?.copyWith(),
                        ),

                        SizedBox(width: 10),

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
        ),
      ),
    );
  }

  Future<dynamic> showmodelbottomshett(BuildContext contxt) {
    return showModalBottomSheet(
      context: contxt,
      isScrollControlled: true, // <- very important
      builder: (innercontext) {
        final bottomPadding = MediaQuery.of(innercontext).viewInsets.bottom;

        return Container(
          margin: EdgeInsets.only(bottom: bottomPadding),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: AppColors.bottombarcolor,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add a display location",
                  style: context.myTextTheme.titleMedium,
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Business Name",
                    filled: true,
                    fillColor: AppColors.cardcolor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Business address",
                    filled: true,
                    fillColor: AppColors.cardcolor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Business Name",
                    filled: true,
                    fillColor: AppColors.cardcolor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: innercontext.myTextTheme.bodyMedium?.copyWith(
                        color: AppColors.textbuttoncolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
