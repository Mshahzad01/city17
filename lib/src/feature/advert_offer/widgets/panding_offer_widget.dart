import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/feature/advert_offer/widgets/bidding_offer_widget.dart';
import 'package:flutter/material.dart';

class Pandingofferwidget extends StatelessWidget {
  const Pandingofferwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              color: AppColors.secondrybagroundcolor,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hint: Text(StringData.serachbusinesscategory),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: AppColors.backgroundcolor,
                    filled: true,
                    suffix: Icon(Icons.search, size: 20),
                    contentPadding: EdgeInsets.only(
                      top: 02,
                      left: 10,
                      right: 10,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 05),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 05),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.backgroundcolor,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("dumy bussiness category name")],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            labelColor: AppColors.textcolor,
            unselectedLabelColor: AppColors.textcolor.withValues(alpha: 0.3),
            indicatorColor: AppColors.backgroundcolor,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,

            indicator: BoxDecoration(
              color: AppColors.blckbtncolor,
              borderRadius: BorderRadius.circular(08),
            ),

            indicatorPadding: EdgeInsets.all(05),

            tabs: [
              Tab(text: "Bedding"),
              Tab(text: "Fixed"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                BiddingOfferWidget(),
                Center(child: Text("Fixed")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
