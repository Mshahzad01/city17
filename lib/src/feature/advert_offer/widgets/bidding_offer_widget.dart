import 'package:flutter/material.dart';

class BiddingOfferWidget extends StatefulWidget {
  const BiddingOfferWidget({super.key});

  @override
  State<BiddingOfferWidget> createState() => _BiddingOfferWidgetState();
}

class _BiddingOfferWidgetState extends State<BiddingOfferWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 70, decoration: BoxDecoration()),
        // Container(
        //   height: 60,
        //   width: double.infinity,
        //   // padding: const EdgeInsets.all(10),
        //   child: HorizontalCalendar(
        //     date: selectedDate,
        //     primaryTextcolor: Colors.black45,
        //     primarycolor: Colors.white,
        //     selectedColor: Colors.blue,
        //     showMonth: true,
        //     onDateSelected: (date) {
        //       setState(() {
        //         selectedDate = date;
        //       });
        //       print("Selected Date: $date");
        //     },
        //   ),
        // ),
      ],
    );
  }
}
