// import 'package:city17/src/constant/app_color.dart';
// import 'package:city17/src/core/extension/context_ext.dart';
// import 'package:city17/src/feature/home/model/display_model.dart';
// import 'package:city17/src/feature/home/widgets/display_stuts_widget.dart';
// import 'package:flutter/material.dart';

// class BusinessDisplyWidget extends StatelessWidget {
//    BusinessDisplyWidget({super.key});


//   final data = dumyDisplays[0];

//   @override
//   Widget build(BuildContext context) {
//     return    Column(
//                     children: [
//                       //Offline
//                       Container(
//                         margin: EdgeInsets.only(bottom: 10, top: 05),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             width: 1,
//                             color: AppColors.circulcolor,
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor: AppColors.circulcolor,
//                                   radius: 08,
//                                 ),
//                                 SizedBox(width: 08),
//                                 Text(
//                                   data.displayOffline.status.title,
//                                   style: context.myTextTheme.titleMedium
//                                       ?.copyWith(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                             DisplayStatusWidget(
//                               title: data.title,
//                               displytime: data.displayOffline.time,
//                               displygrowth: data.displayOffline.growth,
//                               displyreven: data.displayOffline.revenue,
//                               displayuptime: data.displayOffline.uptime,
//                             ),
//                             DisplayStatusWidget(
//                               title: data.title,
//                               displytime: data.displayOffline.time,
//                               displygrowth: data.displayOffline.growth,
//                               displyreven: data.displayOffline.revenue,
//                               displayuptime: data.displayOffline.uptime,
//                             ),

//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Warning!",
//                                   style: context.myTextTheme.titleSmall
//                                       ?.copyWith(
//                                         color: AppColors.textbuttoncolor,
//                                       ),
//                                 ),
//                                 SizedBox(
//                                   width: 8,
//                                 ), 
//                                 Expanded(
//                                   child: Text(
//                                     "${data.displayOffline.warning}",
//                                     style: context.myTextTheme.titleSmall,
//                                     maxLines: 2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),

//                       Divider(
//                         color: AppColors.textcolor.withValues(alpha: 0.1),
//                       ),

//                       //Online
//                       Container(
//                         margin: EdgeInsets.only(bottom: 05, top: 05),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             width: 1,
//                             color: AppColors.greencolor,
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor: AppColors.greencolor,
//                                   radius: 08,
//                                 ),
//                                 SizedBox(width: 08),
//                                 Text(
//                                   data.displayOnline.status.title,
//                                   style: context.myTextTheme.titleMedium
//                                       ?.copyWith(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                             DisplayStatusWidget(
//                               title: data.title,
//                               displytime: data.displayOnline.time,
//                               displygrowth: data.displayOnline.growth,
//                               displyreven: data.displayOnline.revenue,
//                               displayuptime: data.displayOnline.uptime,
//                             ),
//                             DisplayStatusWidget(
//                               title: data.title,
//                               displytime: data.displayOnline.time,
//                               displygrowth: data.displayOnline.growth,
//                               displyreven: data.displayOnline.revenue,
//                               displayuptime: data.displayOnline.uptime,
//                             ),
//                           ],
//                         ),
//                       ),

//                       Divider(
//                         color: AppColors.textcolor.withValues(alpha: 0.1),
//                       ),

//                       // dart
//                       Container(
//                         margin: EdgeInsets.only(top: 05, bottom: 05),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             width: 1,
//                             color: AppColors.textcolor.withValues(alpha: 0.3),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor: AppColors.textcolor
//                                       .withValues(alpha: 0.3),
//                                   radius: 08,
//                                 ),
//                                 SizedBox(width: 08),
//                                 Text(
//                                   data.displaydrat.status.title,
//                                   style: context.myTextTheme.titleMedium
//                                       ?.copyWith(fontSize: 14),
//                                 ),
//                               ],
//                             ),

//                             Container(
//                               height: 50,
//                               margin: EdgeInsets.only(top: 08, bottom: 05),
//                               padding: EdgeInsets.only(
//                                 left: 10,
//                                 right: 10,
//                                 top: 05,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),

//                                 color: AppColors.cardcolor,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "${data.title}",
//                                     style: context.myTextTheme.titleSmall
//                                         ?.copyWith(fontSize: 11),
//                                   ),

//                                   GestureDetector(
//                                     child: Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: Text(
//                                         "Complete Setup",
//                                         style: context.myTextTheme.titleSmall
//                                             ?.copyWith(
//                                               color: AppColors.textbuttoncolor,
//                                             ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
                
              
//   }
// }