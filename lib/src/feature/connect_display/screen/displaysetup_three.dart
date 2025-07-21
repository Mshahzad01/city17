import 'dart:io';

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utilss/image_picker.dart';
import 'package:city17/src/feature/connect_display/widgets/setep_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class DisplaySetupThree extends StatefulWidget {
  const DisplaySetupThree({super.key});
  static const routename = '/displaythree';

  @override
  State<DisplaySetupThree> createState() => _DisplaySetupThreeState();
}

class _DisplaySetupThreeState extends State<DisplaySetupThree> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source, BuildContext content) async {
    final file = await ImageUtils.pickImage(source, context);

    if (file != null) {
      setState(() {
        _imageFile = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.connectdisplay),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding,
        ),
        child: Column(
          children: [
            const SizedBox(height: myPadding),
             const SetepIndicatorWidget(currentsetyp: 2),
            Container(
              margin: const EdgeInsets.only(top: myPadding * 2),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryTextcolor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),

              child: _imageFile != null
                  ? Image.file(_imageFile!, fit: BoxFit.cover)
                  : const Center(child: Text('No Image Selected')),
            ),

            const SizedBox(height: 30),

            // ElevatedButton(
            //   onPressed: _showImageSourceDialog,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColors.secondarycolor,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: myPadding,
            //       vertical: myPadding,
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset('assets/icons/camera.svg', height: 24),
            //       const SizedBox(width: 10),
            //       Text(
            //         'Add a Display Image',
            //         style: context.myTextTheme.titleMedium?.copyWith(
            //           color: AppColors.accentTextcolor,
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            CustomButton(title: 'Add a Disply Image', onPressed: _showImageSourceDialog,
            textcolor: AppColors.accentTextcolor,
            
            svgicon: 'assets/icons/camera.svg'),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonRow(
        onSaveAsDraft: () {
          Navigator.pushNamed(context, DisplaySetupThree.routename);
        },
        onNext: () {
          // Navigator.pushNamed(context, DisplaySetupThree.routename);
        },
        btn1title: StringData.safeasdraft,
        btn2title: StringData.next,
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera, context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
