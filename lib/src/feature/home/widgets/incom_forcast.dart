import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/cubit/home_cubit.dart';
import 'package:city17/src/feature/home/cubit/home_state.dart';
import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:city17/src/feature/home/widgets/income_tab_widget.dart';
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
                color: AppColors.primaryTextcolor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: myPadding * 2),
                  child: Text(
                    slectedgraph,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryTextcolor,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.primaryTextcolor,
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

                  color: AppColors.primarycolor,
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
                      color: AppColors.secondarycolor,
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
                                        color: AppColors.primaryTextcolor
                                            .withValues(alpha: 0.5),
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
                                color: AppColors.successTextcolor.withValues(
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
                                          color: AppColors.successTextcolor,
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
                              width: 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(05),
                                color: Colors.white.withValues(alpha: 0.1),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: IncomeType.values.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    child: IncomeTab(
                                      label: e,
                                      onTap: () {
                                        context.read<HomeCubit>().getChartData(
                                          e,
                                        );
                                      },
                                    ),
                                  );
                                }).toList(),
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

                                color: AppColors.successTextcolor,
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
                      color: AppColors.secondarycolor,
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
                            width: 145,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(05),
                              color: Colors.white.withValues(alpha: 0.1),
                            ),

                            child: Row(
                              children: IncomeType.values.map((e) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 02),
                                  child: IncomeTab(
                                    label: e,
                                    onTap: () {
                                      context
                                          .read<HomeCubit>()
                                          .seletedincometypechange(e);
                                      context.read<HomeCubit>().selectdata();
                                    },
                                  ),
                                );
                              }).toList(),
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
                              color: AppColors.successTextcolor.withValues(
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
                                        ?.copyWith(
                                          color: AppColors.successTextcolor,
                                        ),
                                  ),

                                SizedBox(width: 04),

                                SvgPicture.asset(
                                  AssetString.arrowicon,
                                  colorFilter: ColorFilter.mode(
                                    state.percentage == 0
                                        ? AppColors.linkTextcolor
                                        : AppColors.successTextcolor,
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

                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.primaryTextcolor,
                              fontSize: 30,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text(
                            "AUD",

                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.primaryTextcolor.withValues(
                                alpha: 0.5,
                              ),
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
}
