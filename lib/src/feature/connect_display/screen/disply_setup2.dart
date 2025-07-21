import 'dart:convert';
import 'dart:io';

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/component/custom_button.dart';

import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/connect_display/widgets/setep_indicator_widget.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import 'displaysetup_three.dart';

class DisplySetupTwo extends StatefulWidget {
  const DisplySetupTwo({super.key});
  static const routename = '/displysetuptwo';

  @override
  State<DisplySetupTwo> createState() => _DisplySetupTwoState();
}

class _DisplySetupTwoState extends State<DisplySetupTwo> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Map<String, dynamic>? ledInfo;
  bool showScanner = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      try {
        final data = jsonDecode(scanData.code!);
        setState(() {
          ledInfo = data;
          showScanner = false;
        });
        controller.pauseCamera();
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid QR Code')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.connectdisplay),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: myPadding),
            const SetepIndicatorWidget(currentsetyp: 1),
            Container(
              margin: const EdgeInsets.all(myPadding),
              width: double.infinity,
              padding: const EdgeInsets.all(myPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondarycolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (ledInfo != null) ...[
                    Text(
                      "Brand: ${ledInfo!['brand']}",
                      style: context.myTextTheme.titleMedium,
                    ),
                    Text(
                      "Model: ${ledInfo!['model']}",
                      style: context.myTextTheme.titleMedium,
                    ),
                    Text(
                      "Resolution: ${ledInfo!['resolution']}",
                      style: context.myTextTheme.titleMedium,
                    ),
                  ] else
                    const Text('No data scanned yet'),
                  const SizedBox(height: myPadding),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showScanner = !showScanner;
                        if (!showScanner) {
                          controller?.pauseCamera();
                          ledInfo = null;
                        } else {
                          controller?.resumeCamera();
                        }
                      });
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: myPadding / 2,
                        vertical: myPadding / 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      maximumSize: const Size(double.infinity, 50),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text(showScanner ? 'Hide Scanner' : 'Scan QR Code'),
                  ),

      
                    

                  
                  
                  
                  const SizedBox(height: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: showScanner ? 300 : 0,
                    child: showScanner
                        ? QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                            overlay: QrScannerOverlayShape(
                              borderColor: AppColors.successTextcolor,
                              borderRadius: 10,
                              borderLength: 20,
                              borderWidth: 8,
                              cutOutSize: 250,
                            ),
                            onPermissionSet: (ctrl, p) {
                              if (!p) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No camera permission'),
                                  ),
                                );
                              }
                            },
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomButtonRow(
        onSaveAsDraft: () {
          Navigator.pushNamed(context, DisplaySetupThree.routename);
        },
        onNext: () {
          Navigator.pushNamed(context, DisplaySetupThree.routename);
        },
        btn1title: StringData.safeasdraft,
        btn2title: StringData.next,
      ),
    );
  }
}
