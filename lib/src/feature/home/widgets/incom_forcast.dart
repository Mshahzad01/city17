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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    slectedgraph,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.textcolor,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.textcolor,
                    size: 30,
                  ),
                  onSelected: (String value) {
                    setState(() {
                      slectedgraph = value;
                      if (value == 'Textual') {
                        context.read<HomeCubit>().selectdata();
                      } else if (value == 'Graphical') {
                        context.read<HomeCubit>().newfun();
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return graphrep.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },

                  color: AppColors.backgroundcolor,
                ),
              ],
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(0),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (graphrep[1] == slectedgraph) {
                if (state is Chartdatasate) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondrybagroundcolor,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 03),
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

                              height: 20,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(04),
                                color: AppColors.greentextcolor.withValues(
                                  alpha: 0.1,
                                ),
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

                                    colorFilter: ColorFilter.mode(
                                      Colors.green,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(05),
                                color: Colors.white.withValues(alpha: 0.1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  buildtab(IncomeType.day, context),
                                  SizedBox(width: 08),

                                  buildtab(IncomeType.week, context),
                                  SizedBox(width: 08),

                                  buildtab(IncomeType.month, context),
                                  SizedBox(width: 08),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 05),
                        Container(
                          height: 138,
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
                if (state is Dataloadedstate) {
                  return Container(
                    padding: EdgeInsets.all(10),

                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondrybagroundcolor,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(top: 08, right: 08),
                            height: 25,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(05),
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildTab(IncomeType.day, context),
                                SizedBox(width: 05),

                                _buildTab(IncomeType.week, context),
                                SizedBox(width: 05),

                                _buildTab(IncomeType.month, context),
                                SizedBox(width: 05),
                              ],
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,

                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            //    padding: EdgeInsets.only(bottom: 02),
                            height: 25,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(04),
                              color: AppColors.greentextcolor.withValues(
                                alpha: 0.1,
                              ),
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
                                  colorFilter: ColorFilter.mode(
                                    state.percentage == 0
                                        ? Color(0xff5565AF)
                                        : Colors.green,
                                    BlendMode.srcIn,
                                  ),
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

  Widget buildtab(IncomeType label, BuildContext context) {
    bool isSelected = context.read<HomeCubit>().incomeType == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          context.read<HomeCubit>().getChartData(label);
        });
      },
      child: Container(
        height: double.infinity,
        //width: 60,
        padding: EdgeInsets.only(top: 04, bottom: 04, left: 04, right: 04),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label.title,
          style: context.myTextTheme.titleSmall?.copyWith(
            fontFamily: "myfonts",
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildTab(IncomeType incType, BuildContext context) {
    final type = context.read<HomeCubit>().incomeType;
    final isSelected = type == incType;

    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().seletedincometypechange(incType);
        context.read<HomeCubit>().selectdata();
      },
      child: Container(
        height: double.infinity,

        padding: EdgeInsets.only(top: 04, bottom: 04, left: 04, right: 06),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(04),
        ),
        child: Text(
          incType.title,
          style: context.myTextTheme.titleSmall?.copyWith(
            fontFamily: "myfonts",
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
