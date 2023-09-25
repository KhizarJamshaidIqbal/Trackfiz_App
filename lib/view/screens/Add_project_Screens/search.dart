// // ignore_for_file: prefer_const_constructors, unused_field, library_private_types_in_public_api, prefer_final_fields, non_constant_identifier_names, unnecessary_null_comparison, avoid_print, use_build_context_synchronously
// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackfiz_app/Utils/widgets.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> _placesList = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    getsuggestion(searchController.text);
  }

  Future<void> getsuggestion(String input) async {
    String KPLACES_API_KEY = "AIzaSyDXfDrNgYK-yhjkIaXbXDnNiGcduFBHYnk";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$KPLACES_API_KEY';
    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      try {
        setState(() {
          _placesList = jsonDecode(response.body.toString())['predictions'];
          print(response.body.toString());
        });
      } catch (e) {
        print('Failed to load data');
      }
    } else {
      print('Failed to load data');
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search your location...',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                          });
                        },
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      filled: true,
                      fillColor: Color(0xffEEF0F1),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xffE3E5E8),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CoustomText(
                    text: 'Cancel',
                    color: Color(0xff0F509D),
                    fontsize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _placesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    if (_placesList[index]['description'].isNotEmpty) {
                      try {
                        List<Location> locations = await locationFromAddress(
                            _placesList[index]['description']);
                        if (locations.isNotEmpty) {
                          LatLng selectedLatLng = LatLng(
                            locations.first.latitude,
                            locations.first.longitude,
                          );
                          Navigator.pop(context, selectedLatLng);
                        } else {
                          Navigator.pop(context, null);
                        }
                      } catch (e) {
                        print('Error: $e');
                      }
                    } else {
                      print('Error');
                    }
                  },
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff0F509D),
                  ),
                  title: CoustomText(
                    text: _placesList[index]['description'],
                    color: Color(0xff08111B),
                    fontsize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  subtitle: CoustomText(
                    text: _placesList[index]['structured_formatting']
                        ['secondary_text'],
                    color: Color(0xff979797),
                    fontsize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
