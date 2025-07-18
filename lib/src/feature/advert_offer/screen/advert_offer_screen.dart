import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(myPadding),
      child: DefaultTabController(
        length: 3,

        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: TabBar(
                labelColor: AppColors.primaryTextcolor,
                unselectedLabelColor: AppColors.primaryTextcolor.withValues(
                  alpha: 0.3,
                ),
                indicatorColor: AppColors.primarycolor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,

                indicator: BoxDecoration(
                  color: AppColors.transparentBlack,
                  borderRadius: BorderRadius.circular(05),
                ),
                indicatorWeight: 02,
                // indicatorPadding: EdgeInsets.all(05),
                tabs: [
                  const Tab(text: 'Panding'),
                  const Tab(text: 'Active'),
                  const Tab(text: 'Completed'),
                ],
              ),
            ),

            const Expanded(
              child: TabBarView(
                children: [
                  Pandingofferwidget(),
                  Center(child: Text('Active')),
                  Center(child: Text('Completed')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
