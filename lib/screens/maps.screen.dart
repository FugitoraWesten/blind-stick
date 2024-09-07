import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:blindflutter/models/location.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Position? position = await determinePosition();
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng initialCenter = _currentPosition != null
        ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
        : LatLng(8.9806, 38.7578);

    return Scaffold(
      appBar: AppBar(
        title: Text("Map Example"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: initialCenter,
          initialZoom: 11,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.doubleTapZoom,
          ),
        ),
        children: [
          openStreetMapTileLayer,
          MarkerLayer(
            markers: [
              Marker(
                point: initialCenter,
                width: 60,
                height: 60,
                child: Icon(
                  Icons.location_pin,
                  size: 60,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.blind_parking.example',
    );
