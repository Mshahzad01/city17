// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class GetAddressBS extends StatefulWidget {
//   const GetAddressBS({super.key});

//   @override
//   State<GetAddressBS> createState() => _GetAddressBSState();
// }

// class _GetAddressBSState extends State<GetAddressBS> {
//   GoogleMapController? _controller;
//   LatLng? _selectedPosition;
//   String _address = 'Searching address...';
//   double? latitude;
//   double? longitude;

//   @override
//   void initState() {
//     super.initState();
//     _askPermissionAndGetLocation();
//   }

//   Future<void> _askPermissionAndGetLocation() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       _updateMarkerAndAddress(LatLng(position.latitude, position.longitude));
//     } else {
//       setState(() {
//         _address = "Location permission denied";
//       });
//     }
//   }

//   Future<void> _updateMarkerAndAddress(LatLng pos) async {
//     setState(() {
//       _selectedPosition = pos;
//       latitude = pos.latitude;
//       longitude = pos.longitude;
//     });

//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         pos.latitude,
//         pos.longitude,
//       );
//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         setState(() {
//           _address =
//               '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _address = "Address not found";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.85,
//       child: Column(
//         children: [
//           Expanded(
//             child: _selectedPosition == null
//                 ? const Center(child: CircularProgressIndicator())
//                 : GoogleMap(
//                     initialCameraPosition: CameraPosition(
//                       target: _selectedPosition!,
//                       zoom: 16,
//                     ),
//                     onMapCreated: (controller) {
//                       _controller = controller;
//                     },
//                     markers: {
//                       Marker(
//                         markerId: const MarkerId('selected_marker'),
//                         position: _selectedPosition!,
//                         draggable: true,
//                         onDragEnd: (newPosition) {
//                           _updateMarkerAndAddress(newPosition);
//                         },
//                       ),
//                     },
//                     onTap: (LatLng tappedPosition) {
//                       _updateMarkerAndAddress(tappedPosition);
//                     },
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   readOnly: true,
//                   decoration: InputDecoration(
//                     labelText: 'Selected Address',
//                     border: OutlineInputBorder(),
//                     hintText: _address,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Lat: ${latitude?.toStringAsFixed(5) ?? "-"}'),
//                     Text('Lng: ${longitude?.toStringAsFixed(5) ?? "-"}'),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, {
//                       'lat': latitude,
//                       'lng': longitude,
//                       'address': _address,
//                     });
//                   },
//                   child: const Text("Confirm Address"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
