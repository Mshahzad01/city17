import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';



class SetepIndicatorWidget extends StatelessWidget {
  const SetepIndicatorWidget({super.key, required this.currentsetyp});
     

     static const routename = '/setupindecator';
  final int currentsetyp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return Text(
          'Setp ${index + 1}',
          style: context.myTextTheme.titleMedium?.copyWith(
            color: index == currentsetyp
                ? AppColors.primaryTextcolor
                : AppColors.primaryTextcolor.withValues(alpha: 0.4),
          ),
        );
      }),
    );
  }
}



class CustomButtonRow extends StatelessWidget {
  final VoidCallback onSaveAsDraft;
  final VoidCallback onNext;
  final String btn1title;
  final String btn2title;

  const CustomButtonRow({
    super.key,
    required this.onSaveAsDraft,
    required this.onNext,
    required this.btn1title,
    required this.btn2title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 16, right: 16),
      height: 60,
      color: AppColors.bottombarcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onSaveAsDraft,

            child: const Text('Save as Draft'),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.secondarycolor,
                borderRadius: BorderRadius.circular(08),
              ),
              alignment: Alignment.center,
              child: Text(
                btn2title,
                style: context.myTextTheme.titleSmall?.copyWith(
                  color: AppColors.accentTextcolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}















// import 'package:city17/src/constant/app_color.dart';
// import 'package:city17/src/core/extension/context_ext.dart';
// import 'package:city17/src/feature/connect_display/screen/connet_display_setep1.dart';
// import 'package:city17/src/feature/connect_display/screen/displaysetup_three.dart';
// import 'package:city17/src/feature/connect_display/screen/disply_setup2.dart';
// import 'package:flutter/material.dart';

// class DisplaySetupFlowScreen extends StatefulWidget {
//   const DisplaySetupFlowScreen({super.key});

//   static const routename = '/display-setup-flow';

//   @override
//   State<DisplaySetupFlowScreen> createState() => _DisplaySetupFlowScreenState();
// }

// class _DisplaySetupFlowScreenState extends State<DisplaySetupFlowScreen> {
//   int currentStep = 0;

//   void nextStep() {
//     if (currentStep == 0) {
      
  
//     } else if (currentStep == 1) {

      
  
//     } else if (currentStep == 2) {

//     }

//     if (currentStep < 2) {
//       setState(() {
//         currentStep++;
//       });
//     }
//   }

//   // void previousStep() {
//   //   if (currentStep > 0) {
//   //     setState(() {
//   //       currentStep--;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {

//     return WillPopScope(
      
//       onWillPop: () {  },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Display Setup'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             const SizedBox(height: 10),
//             SetepIndicatorWidget(currentsetyp: currentStep),
      
//             Expanded(
//               child: IndexedStack(
//                 index: currentStep,
//                 children: const [
//                   Connectdisplaysetpone(), // Step 1
//                 DisplySetupTwo(),      // Step 2
//                   DisplaySetupThree(),     // Step 3
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: CustomButtonRow(
//           onSaveAsDraft: () {
//             print("Saving Draft at Step $currentStep");
//           },
//           onNext: nextStep,
//           btn1title: 'Save as Draft',
//           btn2title: currentStep == 2 ? 'Submit' : 'Next',
//         ),
//       ),
//     );
//   }
// }