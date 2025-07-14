import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidgets extends StatefulWidget {
  GraphWidgets({super.key});

  @override
  State<GraphWidgets> createState() => _GraphWidgetsState();
}

class _GraphWidgetsState extends State<GraphWidgets> {
  List<ChartData> dayData = [
    ChartData('Mon', 10),
    ChartData('Tue', 20),
    ChartData('Wed', 30),
    // ChartData('Thu', 20),
    // ChartData('Fri', 80),
    // ChartData('Sat', 35),
    // ChartData('Sun', 60),
  ];

  List<ChartData> weekData = [
    ChartData('Week 1', 20),
    ChartData('Week 2', 25),
    ChartData('Week 3', 30),
    ChartData('Week 4', 80),
  ];

  List<ChartData> monthData = [
    ChartData('Jan', 1200),
    ChartData('Feb', 1100),
    ChartData('Mar', 1350),
    ChartData('Apr', 900),
  ];

  List<ChartData> getChartData(String type) {
    switch (type) {
      case 'Today':
        return dayData;
      case 'Week':
        return weekData;
      case 'Month':
        return monthData;
      default:
        return dayData;
    }
  }

  String seletedtype = "Today";

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      // margin: EdgeInsets.only(left: 16,right: 16),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardcolor,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 110, top: 10),
            padding: EdgeInsets.only(top: 10),
            height: 30,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withValues(alpha: 0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildtab("Today"),
                SizedBox(width: 08),

                buildtab("Week"),
                SizedBox(width: 08),

                buildtab("Month"),
                SizedBox(width: 08),
              ],
            ),
          ),

          // Align(
          //   alignment: Alignment.centerRight,

          //   child: Container(
          //     margin: EdgeInsets.only(right: 10, top: 10),
          //     //    padding: EdgeInsets.only(bottom: 02),
          //     height: 30,
          //     width: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(04),
          //       color: Colors.white.withValues(alpha: 0.1),
          //     ),

          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [

          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.only(right: 0, top: 0),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 25),

              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),

              series: [
                LineSeries<ChartData, String>(
                  dataSource: getChartData(seletedtype),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.value,
                  name: 'Income',

                  color: Color(0xff6AB503),
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    width: 5,
                    height: 5,

                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildtab(String label) {
    bool isSelected = seletedtype == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          seletedtype = label;
        });
      },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}
