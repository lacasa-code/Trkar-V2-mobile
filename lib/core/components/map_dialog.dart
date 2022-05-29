import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/core/helper/navigator.dart';

class MapDialog extends StatefulWidget {
  const MapDialog({
    Key? key,
    required this.onPickedLocation,
  }) : super(key: key);
  final void Function(LatLng, String) onPickedLocation;

  @override
  _MapDialogState createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {
  Marker? marker;
  Set<Marker> markers = {};
  var addressController = TextEditingController();
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late GoogleMapController _controller;

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: ScreenUtil().setHeight(200),
          width: double.infinity,
          child: GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            onTap: (latLng) {
              getAddressFromPosition(latLng);
            },
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
        ),
        const BoxHelper(
          height: 20,
        ),
        RegisterField(
          controller: addressController,
          maxLines: null,
          hintText: 'address',
        ),
        const BoxHelper(
          height: 20,
        ),
        RegisterButton(
          title: 'ok',
          onPressed: () {
            if (marker != null && addressController.text.isNotEmpty) {
              widget.onPickedLocation(
                marker!.position,
                addressController.text,
              );
            }
            context.router.pop();
          },
        ),
        const BoxHelper(
          height: 20,
        ),
      ],
    );
  }

  Future<void> getCurrentLocation() async {
    // var isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!isLocationEnabled) {
    //   Geol
    //   return;
    // }

    var permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      var position = await Geolocator.getCurrentPosition();

      getAddressFromPosition(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      );
      _controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          marker!.position,
          15,
        ),
      );
    } catch (e) {
      log('error => $e');
    }
  }

  Future<void> getAddressFromPosition(
    LatLng latLng,
  ) async {
    setState(() {
      marker = Marker(
        markerId: MarkerId(
          latLng.latitude.toString(),
        ),
        position: LatLng(
          latLng.latitude,
          latLng.longitude,
        ),
      );
      markers = {marker!};
    });
    var addressFromPosition =
        await GeocodingPlatform.instance.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    var first = addressFromPosition.first;
    var address =
        "${first.locality ?? ''}, ${first.administrativeArea ?? ''},${first.subLocality ?? ''}, ${first.subAdministrativeArea ?? ''},${first.street ?? ''}, ${first.country ?? ''},${first.thoroughfare ?? ''}";

    log('address is => $address ${addressFromPosition.first}');

    addressController.text = address;
  }
}
