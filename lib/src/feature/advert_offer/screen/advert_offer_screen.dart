import 'package:city17/src/constant/app_color.dart';
import 'package:flutter/material.dart';

import '../widgets/panding_offer_widget.dart';

class AdvertOfferScreen extends StatefulWidget {
  const AdvertOfferScreen({super.key});

  @override
  State<AdvertOfferScreen> createState() => _AdvertofferState();
}

class _AdvertofferState extends State<AdvertOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            TabBar(
              labelColor: AppColors.primaryTextcolor,
              unselectedLabelColor: AppColors.primaryTextcolor.withValues(
                alpha: 0.3,
              ),
              indicatorColor: AppColors.primarycolor,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,

              indicator: BoxDecoration(
                color: AppColors.transparentBlack,
                borderRadius: BorderRadius.circular(08),
              ),

              indicatorPadding: EdgeInsets.all(05),

              tabs: [
                Tab(text: "Panding"),
                Tab(text: "Active"),
                Tab(text: "Completed"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Pandingofferwidget(),
                  Center(child: Text("Active")),
                  Center(child: Text("Completed")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
