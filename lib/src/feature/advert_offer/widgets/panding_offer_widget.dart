import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pandingofferwidget extends StatefulWidget {
  const Pandingofferwidget({super.key});

  @override
  State<Pandingofferwidget> createState() => _PandingofferwidgetState();
}

class _PandingofferwidgetState extends State<Pandingofferwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 2,
        vertical: myPadding / 2,
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(myPadding / 2),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: AppColors.secondarycolor,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hint: const Text(StringData.serachbusinesscategory),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: AppColors.primarycolor,
                      filled: true,
                      suffix: const Icon(Icons.search, size: 20),
                      contentPadding: const EdgeInsets.only(
                        top: 02,
                        left: myPadding / 2,
                        right: myPadding / 2,
                      ),
                    ),

                    onChanged: (value) {},
                  ),

                  // Show the list of Business Category
                  Container(
                    margin: const EdgeInsets.only(
                      top: myPadding / 2,
                      bottom: myPadding / 2,
                    ),
                    padding: const EdgeInsets.only(
                      left: myPadding / 2,
                      right: myPadding / 2,
                      top: 05,
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primarycolor,
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('dumy bussiness category name')],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: myPadding / 2),

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
                  borderRadius: BorderRadius.circular(08),
                ),

                //indicatorPadding: EdgeInsets.all(05),
                tabs: [
                  const Tab(text: 'Bedding'),
                  const Tab(text: 'Fixed'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [biddingoffer(), const Text('Fixed')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget biddingoffer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: myPadding,
            bottom: myPadding / 1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: myPadding,
            vertical: myPadding,
          ),
          alignment: Alignment.center,
          color: AppColors.secondarycolor,
          height: 60,
          width: double.infinity,
          child: const Text('Date Clineder'),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetString.alerticon),
            const SizedBox(width: 05),
            const Text('Aelr Text'),
          ],
        ),

        // Expanded(
        //   child: ListView.builder(
        //     padding: const EdgeInsets.all(12),
        //     itemCount: offerList.length,
        //     itemBuilder: (context, index) {
        //       final offer = offerList[index];
        //       return Card(
        //         margin: const EdgeInsets.only(bottom: 20),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(15),
        //         ),
        //         color: Colors.grey[900],
        //         child: const Padding(padding: EdgeInsets.all(12.0)),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
