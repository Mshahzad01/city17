import 'dart:async';

import 'package:city17/src/constant/app_color.dart';
import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/component/custom_button.dart';
import 'package:city17/src/feature/geocode/cubit/cubit/geocode_cubit.dart';
import 'package:city17/src/services/geo_locator_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetAddressBS extends StatefulWidget {
  const GetAddressBS({super.key, this.buttonText = 'Save Address'});

  final String buttonText;

  @override
  State<GetAddressBS> createState() => _GetAddressBSState();
}

class _GetAddressBSState extends State<GetAddressBS> {
  late TextEditingController addressController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition get initialCameraPosition => CameraPosition(
    target: GeolocatorService.instance.latLng ?? const LatLng(30.1575, 71.5249),
    zoom: 14.4746,
  );

  LatLng? selectedCoords;
  Position? currentPosition;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.watch<GeocodeCubit>();
    return BottomSheet(
      onClosing: () {},
      enableDrag: true,
      backgroundColor: AppColors.secondarycolor,
      builder: (BuildContext context) {
        return BlocBuilder<GeocodeCubit, GeocodeState>(
          buildWhen: (p, c) => c is AddressFormatedCoord,
          builder: (context, state) {
            if (state is AddressFormatedCoord && state.address != null) {
              selectedCoords = state.address?.latLng;
            }

            return Padding(
              padding: const EdgeInsets.all(myPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 10,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: size.height * 0.42,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GoogleMap(
                            initialCameraPosition: initialCameraPosition,
                            onCameraMoveStarted: cubit.cameraMoved,
                            onCameraMove: (val) {
                              selectedCoords = val.target;
                            },
                            onCameraIdle: () {
                              if (selectedCoords != null) {
                                cubit.getAddressFromCoords(selectedCoords!);
                              }
                            },
                            onMapCreated: (controller) {
                              _controller.complete(controller);
                            },

                            zoomControlsEnabled: true,
                            myLocationEnabled: true,
                            gestureRecognizers:
                                <Factory<OneSequenceGestureRecognizer>>{
                                  Factory<OneSequenceGestureRecognizer>(
                                    () => EagerGestureRecognizer(),
                                  ),
                                },
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: SvgPicture.asset(
                              AssetString.locationicon, //'location',
                              height: 25,
                              colorFilter: const ColorFilter.mode(
                                AppColors.accentTextcolor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: myPadding),

                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 19,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      state is AddressFormatedCoord && state.address != null
                          ? (state.address?.formattedAddress ??
                                'Select Address')
                          : 'Loading...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: AppColors.primarycolor,
                    textcolor: AppColors.accentTextcolor,

                    onPressed: () {
                      if (state is AddressFormatedCoord &&
                          state.address != null) {
                        Navigator.of(context).pop(state.address);
                      } else {
                        Navigator.of(context).pop(null);
                      }
                    },
                    title: 'Select Address',
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 12),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
