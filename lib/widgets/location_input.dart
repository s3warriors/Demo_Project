// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    // final locData = await Location().getLocation();
    // print(locData);
    // final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
    //   latitude: locData.latitude!,
    //   longitude: locData.longitude!,
    // );
    setState(() {
    _previewImageUrl = "assets/images/map.png";

    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
              isSelecting: true,
            ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              :Image.asset(
  _previewImageUrl!,
  fit: BoxFit.cover,
  width: double.infinity,
  height: 200,
),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.location_on,
              ),
              label: Text('Current Location'),
              onPressed: _getCurrentUserLocation,
            ),
            SizedBox(
              width: 10,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.map,
              ),
              label: Text('Select on Map'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
