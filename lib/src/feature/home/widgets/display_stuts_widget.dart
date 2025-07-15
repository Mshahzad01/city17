// import 'package:city17/src/constant/app_color.dart';
// import 'package:city17/src/constant/asset_string.dart';
// import 'package:city17/src/core/extension/context_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../model/display_model.dart';

// class DisplayStatusWidget extends StatefulWidget {
//   final String title;
//   final String displytime;
//   final double displygrowth;
//   final double displyreven;
//   final double displayuptime;

//   const DisplayStatusWidget({
//     super.key,
//     required this.title,
//     required this.displytime,
//     required this.displygrowth,
//     required this.displyreven,
//     required this.displayuptime,
//   });

//   @override
//   State<DisplayStatusWidget> createState() => _DisplayStatusWidgetState();
// }

// class _DisplayStatusWidgetState extends State<DisplayStatusWidget> {
//   final List<DisplayStatusData> onlineList = dumyDisplays
//       .expand((model) => model.displaydumydata)
//       .where((data) => data.status == DisplayStatus.online)
//       .toList();

//   final List<DisplayStatusData> offlineList = dumyDisplays
//       .expand((model) => model.displaydumydata)
//       .where((data) => data.status == DisplayStatus.offline)
//       .toList();

//   final List<DisplayStatusData> draftlist = dumyDisplays
//       .expand((model) => model.displaydumydata)
//       .where((data) => data.status == DisplayStatus.draft)
//       .toList();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(offlineList.length, (index) {
//         final offlinedata = offlineList[index];

//        return Container(
//           height: 50,
//           margin: EdgeInsets.only(top: 8, bottom: 5),
//           padding: EdgeInsets.only(left: 10, top: 5, bottom: 2),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.cardcolor,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.title,
//                 style: context.myTextTheme.titleMedium?.copyWith(fontSize: 11),
//               ),
//               SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text(
//                     widget.displytime,
//                     style: context.myTextTheme.titleSmall?.copyWith(
//                       fontSize: 10,
//                       color: Colors.white.withOpacity(0.3),
//                     ),
//                   ),
//                   Spacer(),
//                   SvgPicture.asset(AssetString.growthicon),
//                   SizedBox(width: 5),
//                   Text(
//                     widget.displayuptime.toString(),
//                     style: context.myTextTheme.titleSmall,
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     "\$ ${widget.displyreven}",
//                     style: context.myTextTheme.titleSmall,
//                   ),
//                   SizedBox(width: 10),
//                   Container(
//                     margin: EdgeInsets.only(right: 5),
//                     height: 15,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4),
//                       color: AppColors.greencolor.withOpacity(0.1),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "${widget.displygrowth}",
//                           style: context.myTextTheme.titleSmall?.copyWith(
//                             color: Colors.green,
//                             fontSize: 8,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         SvgPicture.asset(
//                           AssetString.arrowicon,
//                           color: Colors.green,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }

// }
