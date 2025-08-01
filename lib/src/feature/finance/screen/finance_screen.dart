import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/finance/screen/pending_payment_tab.dart';
import 'package:flutter/material.dart';

import 'payment_approvals_tab.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  static const routeName = '/finance_screen';

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen>
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
              labelPadding: const EdgeInsets.all(02),

              labelStyle: context.myTextTheme.titleSmall?.copyWith(
                fontSize: 09,
              ),
              tabs: const [
                Tab(text: 'Pending Payments'),

                Tab(text: 'Payment Approvals'),

                Tab(text: 'Payment History'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const PendinPayments(),
                const PaymentApprovalsTab(),
                const Center(child: Text('shahzad')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
