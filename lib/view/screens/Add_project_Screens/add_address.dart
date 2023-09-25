// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_element, unused_local_variable, prefer_const_declarations, avoid_unnecessary_containers, library_private_types_in_public_api, depend_on_referenced_packages, unused_import, unused_field, constant_identifier_names, prefer_final_fields, avoid_print, unnecessary_null_comparison, non_constant_identifier_names, unnecessary_import

import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:location/location.dart' as loc;
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/view/screens/Add_project_Screens/search.dart';
import '../../../Utils/widgets.dart';
import 'add_project.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  GoogleMapController? mapController;
  Location? selectedLocation;
  Set<Marker> _markers = {};
  late BitmapDescriptor customMarkerIcon;
  bool _permissionDenied = false;

  //initState
  @override
  void initState() {
    super.initState();
    loadCustomMarker();
  }
    // Load custom marker icon 
  void loadCustomMarker() async {
    final Uint8List markerIcon =
        await loadAsset('assets/images/markerIcon.png', 100);
    customMarkerIcon = BitmapDescriptor.fromBytes(markerIcon);
    _setMarkers();
  }

  // Load asset and convert it to Uint8List
  Future<Uint8List> loadAsset(String path, int width) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    return bytes;
  }

  void _setMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(32.50665094382158, 74.50922452698633),
          icon: customMarkerIcon,
        ),
      );
    });
  }

  // Initial camera position
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(32.50665094382145, 74.50922452698633),
    zoom: 14.0,
  );

  // Callback when the map is created
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (selectedLocation != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(selectedLocation!.latitude, selectedLocation!.longitude),
            zoom: 14.0,
          ),
        ),
      );
    }
  }

  // Function to update the marker on the map
  void updateMarker(Location location) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('2'),
          icon: customMarkerIcon,
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            snippet: '${location.latitude}, ${location.longitude}',
          ),
        ),
      );
    });
  }

  // Function to navigate to the search screen
  Future<void> _navigateToSearchScreen() async {
    final selectedLatLng = await Navigator.push<LatLng?>(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );

    if (selectedLatLng != null) {
      print('Selected LatLng: $selectedLatLng');

      // Create a new Location object from LatLng
      final locations = await locationFromAddress(
        '${selectedLatLng.latitude}, ${selectedLatLng.longitude}',
      );

      if (locations.isNotEmpty) {
        final selectedLocation = locations.first;
        updateMarker(selectedLocation);
        print('Selected Location: $selectedLocation');

        print('Animating Camera to: $selectedLocation');
        mapController?.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(selectedLocation.latitude, selectedLocation.longitude),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: CustomBackArrow(
          onpress: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: CoustomLinearProgressIndicator(value: 0.7),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                  text: 'Pin your Working Area',
                  color: globalColors.titalColor,
                  fontsize: 26,
                  fontWeight: FontWeight.bold,
                ),
                CoustomText(
                  text: 'Search and pin your working area address',
                  color: Color(0xff08111B),
                  fontsize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: GoogleMap(
                markers: Set<Marker>.of(_markers),
                mapType: MapType.terrain,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialCameraPosition,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .66,
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  InkWell(
                    onTap: _navigateToSearchScreen,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffE3E5E8),
                          width: 2.0,
                        ),
                        color: Color(0xffEEF0F1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13.0,
                          ),
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: Image.asset('assets/images/search.png'),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          CoustomText(
                            text: 'Enter address',
                            color: Color(0xff979797),
                            fontsize: 15,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CoustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProject(),
                          ),
                        );
                      },
                      text: 'Continue')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
