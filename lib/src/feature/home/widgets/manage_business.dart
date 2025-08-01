import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/business_overrview/cubit/bussiness_overview_cubit.dart';
import 'package:city17/src/feature/home/business_overrview/cubit/bussiness_overview_state.dart';
import 'package:city17/src/feature/home/business_overrview/model/bussiness_overview_model.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/location_setting/screen/location_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/asset_string.dart';
import 'display_by_status_widgt.dart';

class MangeBusiness extends StatefulWidget {
  const MangeBusiness({super.key, required this.displayData});
  final List<BusinessModel> displayData;

  @override
  State<MangeBusiness> createState() => _MangeBusinessState();
}

class _MangeBusinessState extends State<MangeBusiness> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: myPadding / 2,
        vertical: myPadding / 2,
      ),
      decoration: const BoxDecoration(
        color: AppColors.secondarycolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(myPadding / 2),
          topRight: Radius.circular(myPadding / 2),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.displayData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = widget.displayData[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: myPadding / 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myPadding / 2),

              color: AppColors.primarycolor,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExpansionTile(
                  onExpansionChanged: (val) {
                    if (val) {
                      final cubit = BlocProvider.of<BussinessOverViewCubit>(
                        context,
                      );

                      cubit.getBussinesData(businessId: data.id);
                    }
                  },
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: myPadding / 2,
                  ),
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: myPadding / 2,
                  ),
                  backgroundColor: AppColors.primarycolor,
                  iconColor: AppColors.primarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(myPadding),
                  ),

                  showTrailingIcon: false,

                  title: Text(
                    data.name,
                    style: context.myTextTheme.titleMedium,
                  ),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              data.address?.formattedAddress ??
                                  'Address not available',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,

                              style: context.myTextTheme.titleMedium?.copyWith(
                                fontSize: 12,

                                color: AppColors.primaryTextcolor.withAlpha(80),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: myPadding),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LocationSetting(data: data),
                                ),
                              ),

                              child: SvgPicture.asset(AssetString.settingicon),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: myPadding / 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.category,

                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.linkTextcolor,
                            ),
                          ),

                          Text(
                            //item[0].status.toString(),
                            '• ert online',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.successTextcolor,
                            ),
                          ),

                          Text(
                            '• ert offline',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: AppColors.errorTextcolor,
                            ),
                          ),

                          Text(
                            '• ert draft',
                            style: context.myTextTheme.titleSmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  children: [
                    BlocBuilder<BussinessOverViewCubit, BussinessOverViewState>(
                      buildWhen: (previous, current) {
                        return (current is BussinesOverViewLoadingState &&
                            current.id == data.id);
                      },
                      builder: (context, state) {
                        if (state is BussinesOverViewLoadingState &&
                            state.loading &&
                            data.id == state.id) {
                          return const Center(
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                        }

                        if (state is BussinesOverViewLoadingState &&
                            state.hasError) {
                          return Center(
                            child: Text(
                              state.message ?? 'Something went wrong',
                            ),
                          );
                        }

                        if (state is BussinesOverViewLoadingState &&
                            state.loaded) {
                          final List<BussinessOverviewModel>? item =
                              state.businessOverViewResponse;

                          if (item == null || item.isEmpty) {
                            return const Center(
                              child: Text('No data available'),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,

                            itemCount: item.length,
                            itemBuilder: (context, index) {
                              final display = item[index];

                              return Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: myPadding / 2,
                                  vertical: myPadding / 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: display.status.color,
                                  ),
                                ),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: display.status.color,
                                          radius: 08,
                                        ),
                                        const SizedBox(width: 08),
                                        Text(
                                          display.status.title,
                                          style: context.myTextTheme.titleMedium
                                              ?.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),

                                    BussinessDisplayWidget(
                                      newDisplay: display.displays,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
