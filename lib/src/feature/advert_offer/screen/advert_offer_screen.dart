import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/feature/advert_offer/screen/pending_offer_screen.dart';
import 'package:flutter/material.dart';

class AdvertOfferScreen extends StatefulWidget {
  const AdvertOfferScreen({super.key});

  @override
  State<AdvertOfferScreen> createState() => _AdvertofferState();
}

class _AdvertofferState extends State<AdvertOfferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(myPadding),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: TabBar(
              controller: _tabController,
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

              tabs: [
                const Tab(text: 'Panding'),
                const Tab(text: 'Active'),
                const Tab(text: 'Completed'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const PendingOfferScreen(),
                const Center(child: Text('Active')),
                const Center(child: Text('Completed')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
