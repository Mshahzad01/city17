import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/setting/screen/payment_method_tab.dart';
import 'package:city17/src/feature/setting/screen/profile_option_tab.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  static const routeName = '/setting+screen                              ';

  @override
  State<SettingScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<SettingScreen>
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
              labelPadding: EdgeInsets.all(02),

              labelStyle: context.myTextTheme.titleSmall?.copyWith(
                fontSize: 10,
              ),
              tabs: const [
                Tab(text: 'Profile Options'),

                Tab(text: 'Payment Methods '),

                Tab(text: 'Trusted Advertisers'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const ProfileOptionTab(),
                const PaymentMethodTab(),
                Center(child: Text('shahzad')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
