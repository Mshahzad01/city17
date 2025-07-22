import 'package:city17/src/feature/advert_offer/screen/model/advertisment_model.dart';
import 'package:flutter/material.dart';

class FixedTab extends StatefulWidget {
  const FixedTab({super.key});

  @override
  State<FixedTab> createState() => _FixedTabState();
}

class _FixedTabState extends State<FixedTab> {
  final mappedData = AdvertismentModel.getDateMappedData();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ...mappedData.entries.map((entry){

        //   final date
        // })
      ],
    );
  }
}
