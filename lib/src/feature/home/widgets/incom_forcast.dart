import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/asset_string.dart';

import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/cubit/home_cubit.dart';
import 'package:city17/src/feature/home/cubit/home_state.dart';
import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomForcast extends StatefulWidget {
  const IncomForcast({super.key});

  @override
  State<IncomForcast> createState() => _IncomForcastState();
}

class _IncomForcastState extends State<IncomForcast> {
  @override
  void initState() {
    context.read<HomeCubit>().selectdata();
    super.initState();
  }

  List<String> graphrep = ['Textual', 'Graphical'];

  String slectedgraph = "Textual";
  double percentage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Income forecast",
              style: context.myTextTheme.titleLarge?.copyWith(
                color: AppColors.textcolor,
           
              ),
            ),
            SizedBox(
              width: 115,

              child: DropdownButton<String>(
                underline: Container(
                  margin: EdgeInsets.only(bottom: 08),
                  height: 01,
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.only(left: 22),
                value: slectedgraph,
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    slectedgraph = newValue!;
                    if (slectedgraph == 'Textual') {
                      context.read<HomeCubit>().selectdata();
                    }
                    if (slectedgraph == 'Graphical') {
                      context.read<HomeCubit>().newfun();
                    }
                  });
                },
                dropdownColor: AppColors.appbackgroundcolor,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.textcolor,
                  size: 35,
                ),
                items: graphrep.map((String graph) {
                  return DropdownMenuItem(
                    value: graph,
                    child: Text(
                      graph,
                      style: context.myTextTheme.titleSmall?.copyWith(
                        color: AppColors.textcolor,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        //   backgroundColor:AppColors.textcolor
                      ), // optional
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(0),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (graphrep[1] == slectedgraph) {
                if (state is chartdatasate) {
              
                  return Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment:MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "  \$${state.totalincome[0].income.toString()}",
                                  style: context.myTextTheme.titleLarge
                                      ?.copyWith(fontSize: 16),
                                ),

                                Text(
                                  "AUD",
                                  style: context.myTextTheme.titleSmall
                                      ?.copyWith(
                                        color: AppColors.textcolor.withValues(
                                          alpha: 0.5,
                                        ),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),

                            Container(
                              margin: EdgeInsets.only(right: 20, top: 05),

                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(04),
                                color: Colors.white.withValues(alpha: 0.1),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.totalincome[0].percentage.toString()}%",
                                    style: context.myTextTheme.titleSmall
                                        ?.copyWith(
                                          color: Colors.green,
                                          fontSize: 10,
                                        ),
                                  ),

                                  SizedBox(width: 04),

                                  SvgPicture.asset(
                                    AssetString.arrowicon,

                                    // ignore: deprecated_member_use
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
                              height: 32,
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
                          ],
                        ),

                        SizedBox(height: 05),
                        Container(
                          height: 146,
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 0, top: 0),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: 100,
                              interval: 25,
                            ),

                            legend: Legend(isVisible: false),
                            tooltipBehavior: TooltipBehavior(enable: true),

                            series: [
                              LineSeries<ChartData, String>(
                                dataSource: state.data,
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
              }

              if (graphrep[0] == slectedgraph) {
                if (state is dataloadedstate) {
                  return Container(
                    padding: EdgeInsets.all(10),

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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 32,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(05),
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildTab("Today", context),
                                SizedBox(width: 08),

                                _buildTab("Week", context),
                                SizedBox(width: 08),

                                _buildTab("Month", context),
                                SizedBox(width: 08),
                              ],
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,

                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            //    padding: EdgeInsets.only(bottom: 02),
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(04),
                              color: Colors.white.withValues(alpha: 0.1),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state.percentage == 0)
                                  Text(
                                    "____",
                                    style: context.myTextTheme.titleSmall
                                        ?.copyWith(color: Color(0xff5565AF)),
                                  ),

                                if (state.percentage != 0)
                                  Text(
                                    "${state.percentage.toString()}%",
                                    style: context.myTextTheme.titleSmall
                                        ?.copyWith(color: Colors.green),
                                  ),

                                SizedBox(width: 04),

                                SvgPicture.asset(
                                  AssetString.arrowicon,
                                  // ignore: deprecated_member_use
                                  color: state.percentage == 0
                                      ? Color(0xff5565AF)
                                      : Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 05),
                          child: Text(
                            "\$ ${state.values.toString()}",
                            //  style: AppTextStyles.title,
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.textcolor,
                              fontSize: 30,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text(
                            "AUD",

                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.textcolor.withValues(alpha: 0.5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SizedBox();
              }

              return SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget buildtab(String label) {
    bool isSelected = context.read<HomeCubit>().seletedtype == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          context.read<HomeCubit>().getChartData(label);
        });
      },
      child: Container(
        height: double.infinity,
        //width: 60,
        padding: EdgeInsets.symmetric(horizontal: 06, vertical: 06),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: context.myTextTheme.titleSmall?.copyWith(
            fontFamily: "myfonts",
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, BuildContext context) {
    final type = context.read<HomeCubit>();
    final isSelected = type.seletedincometype == label;

    return GestureDetector(
      onTap: () {
        
        context.read<HomeCubit>().seletedincometypechange(label);
        context.read<HomeCubit>().selectdata();
      },
      child: Container(
        // margin: EdgeInsets.only(left: 5, right: 5),
        height: double.infinity,
   
        padding: EdgeInsets.symmetric(horizontal: 06, vertical: 06),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: context.myTextTheme.titleSmall?.copyWith(
            fontFamily: "myfonts",
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
