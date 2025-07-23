import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/component/custom_textfield.dart';
import 'package:city17/src/feature/advert_offer/screen/pending_offer/pending_bidding_tab.dart';
import 'package:city17/src/feature/advert_offer/screen/pending_offer/pending_fixed_tab.dart';
import 'package:flutter/material.dart';

class PendingOfferScreen extends StatefulWidget {
  const PendingOfferScreen({super.key});

  @override
  State<PendingOfferScreen> createState() => _PandingofferwidgetState();
}

class _PandingofferwidgetState extends State<PendingOfferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: myPadding / 2),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            CustomTextfield(
              hinttext: 'Search Business Category',
              onChanged: (value) {},
              suffixSVG: AssetString.searchIcon,
            ),

            const SizedBox(height: myPadding),

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
                  borderRadius: BorderRadius.circular(08),
                ),
                tabs: [
                  const Tab(text: 'Bidding'),
                  const Tab(text: 'Fixed'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [const PendingBiddingTab(), const PendingFixedTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Bedding Tab
