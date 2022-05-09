import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/screen_utility.dart';
import '../../../core/extensions/media_query.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AddressMapWidget extends StatefulWidget {
  const AddressMapWidget({
    Key? key,
    required this.isEdit,
    required this.addressFromMap,
  }) : super(key: key);
  final bool isEdit;

  final void Function(LatLng) addressFromMap;

  @override
  State<AddressMapWidget> createState() => _AddressMapWidgetState();
}

class _AddressMapWidgetState extends State<AddressMapWidget> {
  late GoogleMapController _controller;
  Marker? _pickedMarker;

  Future<void> pickLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition();
      setState(() {
        _pickedMarker = Marker(
          markerId: MarkerId(
            position.latitude.toString(),
          ),
          position: LatLng(
            position.latitude,
            position.longitude,
          ),
        );
        _controller
            .animateCamera(CameraUpdate.newLatLng(_pickedMarker!.position));
      });
    } catch (e) {}
  }

  @override
  void initState() {
    pickLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          width: 1,
          color: MainStyle.lightGreyColor,
        ),
      ),
      key: const ValueKey('s'),
      height: context.height * 0.4,
      width: double.infinity,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: GoogleMap(
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {},
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            onCameraMove: (po) {},
            initialCameraPosition: const CameraPosition(
              target: LatLng(
                29.323,
                30.434,
              ),
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            markers: _pickedMarker == null
                ? {}
                : {
                    _pickedMarker!,
                  },
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            onTap: (position) async {
              log('${position.latitude} ${position.longitude}');
              setState(() {
                _pickedMarker = Marker(
                  markerId: const MarkerId('shop_location'),
                  position: LatLng(position.latitude, position.longitude),
                  infoWindow: const InfoWindow(),
                  // icon: _pinLocationIcon,
                );
              });
              widget.addressFromMap(position);
            },
          ),
        ),
      ]),
    );
  }
}
