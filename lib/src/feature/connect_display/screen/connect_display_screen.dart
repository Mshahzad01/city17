// import 'dart:convert';
// import 'dart:io';

// import 'package:city17/src/constant/app_color.dart';
// import 'package:city17/src/constant/app_constants.dart';
// import 'package:city17/src/constant/asset_string.dart';
// import 'package:city17/src/constant/string_data.dart';
// import 'package:city17/src/core/component/custom_button.dart';
// import 'package:city17/src/core/component/custom_textfield.dart';
// import 'package:city17/src/core/extension/context_ext.dart';
// import 'package:city17/src/core/utils/image_picker.dart';
// import 'package:city17/src/feature/connect_display/enum/display_orientation_enum.dart';
// import 'package:city17/src/feature/connect_display/enum/displaylocation_enum.dart';
// import 'package:city17/src/feature/connect_display/enum/screeen_placement_enum.dart';
// import 'package:city17/src/feature/connect_display/enum/screen_installed_enum.dart';
// import 'package:city17/src/feature/connect_display/widgets/custom_radio_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

// class ConnectDisplyScreen extends StatefulWidget {
//   const ConnectDisplyScreen({super.key});

//   static const routeName = '/connect-disply';

//   @override
//   State<ConnectDisplyScreen> createState() => _ConnectDisplyScreenState();
// }

// class _ConnectDisplyScreenState extends State<ConnectDisplyScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final stepOneFormKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CloseButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     color: AppColors.primaryTextcolor,
//                   ),
//                   const SizedBox(width: myPadding * 4),
//                   Text(
//                     StringData.connectdisplay,
//                     style: context.myTextTheme.titleMedium,
//                   ),
//                 ],
//               ),
//               IgnorePointer(
//                 child: TabBar(
//                   enableFeedback: false,
//                   onTap: (v) {},
//                   isScrollable: false,
//                   controller: _tabController,
//                   indicator: const BoxDecoration(color: Colors.transparent),
//                   indicatorWeight: 0,
//                   indicatorColor: Colors.transparent,
//                   dividerHeight: 0,
//                   dividerColor: Colors.transparent,
//                   labelColor: AppColors.primaryTextcolor,
//                   unselectedLabelColor: AppColors.primaryTextcolor.withValues(
//                     alpha: 0.3,
//                   ),
//                   labelStyle: context.myTextTheme.titleMedium,
//                   tabs: const [
//                     IgnorePointer(child: Tab(text: 'Setp 1')),
//                     IgnorePointer(child: Tab(text: 'Setp 2')),
//                     IgnorePointer(child: Tab(text: 'Setp 3')),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       body: TabBarView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: _tabController,
//         children: [
//           _StepOne(formKey: stepOneFormKey),
//           const _SetpTwo(),
//           const _SetpThree(),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: AppColors.bottombarcolor,
//         padding: EdgeInsets.fromLTRB(
//           myPadding,
//           myPadding / 2,
//           myPadding,
//           MediaQuery.of(context).padding.bottom + myPadding / 2,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: CustomButton(
//                 backgroundColor: Colors.transparent,
//                 onPressed: () {},
//                 textcolor: Colors.white,
//                 title: 'Save as Draft',
//               ),
//             ),
//             const SizedBox(width: myPadding),
//             Expanded(
//               child: CustomButton(
//                 title: 'Next',
//                 onPressed: () {
//                   final currentIndex = _tabController.index;

//                   if (currentIndex == 0) {
//                     if (stepOneFormKey.currentState?.validate() ?? false) {
//                       _tabController.animateTo(currentIndex + 1);
//                     }
//                     return;
//                   }
//                   if (currentIndex == 1) {
//                     _tabController.animateTo(currentIndex + 1);
//                     return;
//                   }

//                   if (currentIndex == 3) {
//                     return;
//                   }
//                 },
//                 textcolor: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _StepOne extends StatefulWidget {
//   const _StepOne({required this.formKey});

//   final GlobalKey formKey;

//   @override
//   State<_StepOne> createState() => _StepOneState();
// }

// class _StepOneState extends State<_StepOne> {
//   late TextEditingController _namecontroller;
//   late TextEditingController _sizecontroller;
//   late TextEditingController _discriptioncontroller;

//   @override
//   void initState() {
//     _namecontroller = TextEditingController();
//     _sizecontroller = TextEditingController();
//     _discriptioncontroller = TextEditingController();
//     super.initState();
//   }

//   DisplayLocationType screenType = DisplayLocationType.fixed;

//   ScreenInstallEnum screenlocation = ScreenInstallEnum.resturent;

//   ScreeenPlacementEnum screenplacement = ScreeenPlacementEnum.facingoutside;
//   DisplayOrientation screenorination = DisplayOrientation.horizontal;
//   int selectedIndex = 0;

//   @override
//   void dispose() {
//     _namecontroller.dispose();
//     _sizecontroller.dispose();
//     _discriptioncontroller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.formKey,
//       child: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: myPadding),
//         children: [
//           const SizedBox(height: myPadding),
//           Text(
//             StringData.displyinstallationdetils,
//             style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
//           ),

//           Container(
//             margin: const EdgeInsets.only(top: 16),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.secondarycolor,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   StringData.isthisscreenFixedorMobile,
//                   style: context.myTextTheme.titleMedium?.copyWith(
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 Container(
//                   padding: const EdgeInsets.only(left: 10, top: 15),
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColors.primarycolor,
//                   ),
//                   child: Wrap(
//                     spacing: 08,
//                     children: DisplayLocationType.values.map((x) {
//                       return CustomRadioTile<DisplayLocationType>(
//                         value: x,
//                         groupValue: screenType,
//                         onChanged: (val) => setState(() => screenType = x),
//                       );
//                     }).toList(),
//                   ),
//                 ),

//                 const SizedBox(height: 15),
//                 Text(
//                   StringData.whereisscreeninstalled,
//                   style: context.myTextTheme.titleMedium?.copyWith(
//                     fontSize: 14,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(left: 10, top: 10),
//                   margin: const EdgeInsets.only(top: 10),
//                   height: 65,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColors.primarycolor,
//                   ),
//                   child: Wrap(
//                     spacing: 05,
//                     runSpacing: 05,
//                     children: [
//                       ...ScreenInstallEnum.values.map((x) {
//                         return CustomRadioTile<ScreenInstallEnum>(
//                           value: x,
//                           groupValue: screenlocation,
//                           onChanged: (val) =>
//                               setState(() => screenlocation = x),
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Text(
//                   StringData.screenplacement,
//                   style: context.myTextTheme.titleMedium?.copyWith(
//                     fontSize: 14,
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 Container(
//                   padding: const EdgeInsets.only(left: 10),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColors.primarycolor,
//                   ),
//                   child: Row(
//                     children: ScreeenPlacementEnum.values.map((x) {
//                       return CustomRadioTile<ScreeenPlacementEnum>(
//                         value: x,
//                         groupValue: screenplacement,
//                         onChanged: (val) => setState(() => screenplacement = x),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Customize Screen
//           const SizedBox(height: 15),
//           Text(
//             StringData.customizescreen,
//             style: context.myTextTheme.titleLarge?.copyWith(fontSize: 16),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 16),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.secondarycolor,
//             ),

//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   StringData.screenorientation,
//                   style: context.myTextTheme.titleMedium?.copyWith(
//                     fontSize: 14,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 05),
//                   padding: const EdgeInsets.only(left: 10, top: 05),
//                   height: 110,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColors.primarycolor,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 screenorination = DisplayOrientation.horizontal;
//                               });
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.only(
//                                 left: myPadding,
//                                 top: 05,
//                               ),
//                               height: 60,
//                               width: 95,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 image: const DecorationImage(
//                                   image: AssetImage(AssetString.horizantimage),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 screenorination = DisplayOrientation.veritcal;
//                               });
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               margin: const EdgeInsets.only(
//                                 right: myPadding * 3,
//                                 top: 05,
//                               ),
//                               height: 60,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 image: const DecorationImage(
//                                   image: AssetImage(AssetString.verticalimage),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: myPadding / 2),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           CustomRadioTile<DisplayOrientation>(
//                             value: DisplayOrientation.horizontal,
//                             groupValue: screenorination,
//                             onChanged: (val) =>
//                                 setState(() => screenorination = val),
//                           ),

//                           const SizedBox(width: 40),
//                           CustomRadioTile<DisplayOrientation>(
//                             value: DisplayOrientation.veritcal,
//                             groupValue: screenorination,
//                             onChanged: (val) =>
//                                 setState(() => screenorination = val),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 10),

//           const SizedBox(height: 10),

//           CustomTextfield(
//             controller: _namecontroller,
//             hinttext: 'Name',
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Name required';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: myPadding / 2),

//           CustomTextfield(
//             controller: _sizecontroller,
//             hinttext: 'Size',
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Size is required';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: myPadding / 2),
//           CustomTextfield(
//             controller: _discriptioncontroller,
//             hinttext: 'Discription',

//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Discription is Required';
//               }
//               return null;
//             },
//           ),

//           const SizedBox(height: 10),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const Icon(Icons.info_outline, size: 15),
//                 const SizedBox(width: 05),
//                 Text(
//                   StringData.sharewithpotentialbuyes,
//                   style: context.myTextTheme.titleSmall?.copyWith(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //_SetpTwo screen
// class _SetpTwo extends StatefulWidget {
//   const _SetpTwo();

//   @override
//   State<_SetpTwo> createState() => __SetpTwoState();
// }

// class __SetpTwoState extends State<_SetpTwo> {
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Map<String, dynamic>? ledInfo;
//   bool showScanner = false;

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller?.pauseCamera();
//     }
//     controller?.resumeCamera();
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     final contxt = context;
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       try {
//         final data = jsonDecode(scanData.code!);
//         setState(() {
//           ledInfo = data;
//           showScanner = false;
//         });
//         controller.pauseCamera();
//       } catch (e) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(
//             contxt,
//           ).showSnackBar(const SnackBar(content: Text('Invalid QR Code')));
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Container(
//           margin: const EdgeInsets.all(myPadding),
//           width: double.infinity,
//           padding: const EdgeInsets.all(myPadding),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.secondarycolor,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (ledInfo != null) ...[
//                 Text(
//                   "Brand: ${ledInfo!['brand']}",
//                   style: context.myTextTheme.titleMedium,
//                 ),
//                 Text(
//                   "Model: ${ledInfo!['model']}",
//                   style: context.myTextTheme.titleMedium,
//                 ),
//                 Text(
//                   "Resolution: ${ledInfo!['resolution']}",
//                   style: context.myTextTheme.titleMedium,
//                 ),
//               ] else
//                 const Text('No data scanned yet'),
//               const SizedBox(height: myPadding),

//               CustomButton(
//                 title: 'Scan Qr Code',
//                 onPressed: () {
//                   setState(() {
//                     showScanner = !showScanner;
//                     if (!showScanner) {
//                       controller?.pauseCamera();
//                       ledInfo = null;
//                     } else {
//                       controller?.resumeCamera();
//                     }
//                   });
//                 },

//                 svgicon: AssetString.qricon,
//                 backgroundColor: AppColors.primarycolor,
//               ),

//               const SizedBox(height: 20),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.easeInOut,
//                 width: double.infinity,
//                 height: showScanner ? 300 : 0,
//                 child: showScanner
//                     ? QRView(
//                         key: qrKey,
//                         onQRViewCreated: _onQRViewCreated,
//                         overlay: QrScannerOverlayShape(
//                           borderColor: AppColors.successTextcolor,
//                           borderRadius: 10,
//                           borderLength: 20,
//                           borderWidth: 8,
//                           cutOutSize: 250,
//                         ),
//                         onPermissionSet: (ctrl, p) {
//                           if (!p) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('No camera permission'),
//                               ),
//                             );
//                           }
//                         },
//                       )
//                     : null,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// //get pitcher

// class _SetpThree extends StatefulWidget {
//   const _SetpThree();

//   @override
//   State<_SetpThree> createState() => __SetpThreeState();
// }

// class __SetpThreeState extends State<_SetpThree> {
//   File? _imageFile;

//   Future<void> _pickImage(ImageSource source, BuildContext content) async {
//     final file = await ImageUtils.pickImage(source, context);

//     if (file != null) {
//       setState(() {
//      //   _imageFile = file;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: myPadding,
//         vertical: myPadding,
//       ),
//       child: Column(
//         children: [
//           const SizedBox(height: myPadding),

//           Container(
//             margin: const EdgeInsets.only(top: myPadding * 2),
//             width: double.infinity,
//             height: 250,
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.primaryTextcolor, width: 2),
//               borderRadius: BorderRadius.circular(10),
//             ),

//             child: _imageFile != null
//                 ? Image.file(_imageFile!, fit: BoxFit.cover)
//                 : const Center(child: Text('No Image Selected')),
//           ),

//           const SizedBox(height: 30),

//           CustomButton(
//             title: 'Add a Disply Image',
//             onPressed: _showImageSourceDialog,
//             textcolor: AppColors.accentTextcolor,

//             svgicon: 'assets/icons/camera.svg',
//           ),
//         ],
//       ),
//     );
//   }

//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Select Image Source'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera_alt),
//               title: const Text('Camera'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.camera, context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.gallery, context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
