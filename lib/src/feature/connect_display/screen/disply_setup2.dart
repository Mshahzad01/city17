import 'package:city17/src/constant/string_data.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';

import '../widgets/setep_indicator_widget.dart';

class ConnectDisplaySetupTwo extends StatelessWidget {
  const ConnectDisplaySetupTwo({super.key});
  static const routename = '/displysetuptwo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringData.connectdisplay,
          style: context.myTextTheme.titleMedium,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SetepIndicatorWidget(currentsetyp: 1),

            SizedBox(height: 30),
            Center(child: Text("Qr code Scanner")),
          ],
        ),
      ),
    );
  }
}
