import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapsPage(),
    );
  }
}

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  static const LatLng _initialPosition =
      LatLng(-6.200000, 106.816666);

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Marker Picker"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _initialPosition,
          zoom: 14,
        ),
        myLocationEnabled: true,
        onTap: (LatLng position) {
          setState(() {
            _markers.clear();
            _markers.add(
              Marker(
                markerId: const MarkerId("picked_location"),
                position: position,
                infoWindow: InfoWindow(
                  title: "Lokasi Dipilih",
                  snippet:
                      "Lat: ${position.latitude}, Lng: ${position.longitude}",
                ),
              ),
            );
          });
        },
        markers: _markers,
      ),
    );
  }
}
