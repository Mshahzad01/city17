import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MangeBusiness extends StatefulWidget {
  const MangeBusiness({super.key});

  @override
  State<MangeBusiness> createState() => _MangeBusinessState();
}

class _MangeBusinessState extends State<MangeBusiness> {


   late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList = List.generate(dummyDisplays.length, (_) => false);
  }
  //bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10,),
      decoration: BoxDecoration(color: AppColors.cardcolor),
      child: Column(
        children: [
        
             SizedBox( // You can use Expanded if needed
              height: 400, // Required to limit ListView height
              child: ListView.builder(
                itemCount: dummyDisplays.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = dummyDisplays[index];
                  return   Container(
                    margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(top: 5,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.splashbroudcolor,
            ),
                    child: Column(
                      children: [


                       
                    
                    
                     Padding(
                       padding: const EdgeInsets.only(left: 10,right: 10),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: context.myTextTheme.titleMedium?.copyWith(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.address,
                                style: context.myTextTheme.titleMedium?.copyWith(
                                  color: AppColors.textcolor.withAlpha(80),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(AssetString.settingicon),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                data.type,
                                style: context.myTextTheme.titleSmall?.copyWith(),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${data.display} Display",
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: AppColors.purpletextcolor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${data.status.value} ${data.status.title}",
                            
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: AppColors.greencolor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                              "${data.status.value} ${data.status.title}",
                                style: context.myTextTheme.titleSmall?.copyWith(
                                  color: AppColors.redtextcolor,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Connect a display",
                                style: context.myTextTheme.titleMedium?.copyWith(
                                  color: AppColors.textbuttoncolor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                       if (isExpandedList[index])
                            Column(
                              children: const [
                                Text("shahzad"),
                                    Text("shahzad"),
                                        Text("shahzad"),
                                            Text("shahzad"),
                              ],
                            ),
                        ]
                                           ),
                     ),




                           Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                        color: Colors.white.withValues(alpha: 0.1),
                    ),
                  
                    child: GestureDetector
                    (
                      onTap: () {
                  
                        setState(() {
                           isExpandedList[index]= !isExpandedList[index]  ;
                        });
                           
                      },
                      child: 
                      
                    
            
                      
                      Center(child: SvgPicture.asset(
                            isExpandedList[index]? 
                        
                        AssetString.dropup: AssetString.drowpdownicon))
                      ),
                  ),
                      ],
                    ),
                  );
                },
              ),
            ),
          
        ],
      ),
    );
  }
}
