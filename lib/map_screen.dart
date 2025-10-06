
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:testtt/test_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterMap(
            options: MapOptions(
              keepAlive: true,
              initialCenter: const LatLng(32, 53),
              initialZoom: 5,

              // cameraConstraint: CameraConstraint.contain(
              //   bounds: LatLngBounds(
              //     const LatLng(-90, -180),
              //     const LatLng(90, 180),
              //   ),
              // ),

            ),
            children: [


              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // urlTemplate: 'https://stamen-tiles.a.ssl.fastly.net/toner-background/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                tileProvider: CancellableNetworkTileProvider(),
                // subdomains: ['a','b','c'],
              ),

              // openStreetMapTileLayer,
              RichAttributionWidget(
                  popupInitialDisplayDuration: const Duration(seconds: 5),
                  animationConfig: const ScaleRAWA(),
                  showFlutterMapAttribution: false,
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      // onTap: () async => launchUrl(
                      //   Uri.parse('https://openstreetmap.org/copyright'),
                      // ),
                    ),
                    const TextSourceAttribution(
                      'This attribution is the same throughout this app, except '
                          'where otherwise specified',
                      prependCopyright: false,
                    ),
                  ])

            ],
        ),

      ),
    );
  }
}


