import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:appscratch/pages/location_service.dart';
import 'drivers.dart'; // Importa el archivo de conductores

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;
  double pricePerKilometer = 2; // Precio por kilómetro en pesos colombianos
  double totalCost = 0;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.230833, -75.590553),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMAJMC Map'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              markers: _markers,
              polygons: _polygons,
              polylines: _polylines,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (point) {
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _originController,
                  decoration: InputDecoration(
                    labelText: 'Origen',
                    hintText: 'Ciudad / Departamento / Barrio',
                  ),
                  onChanged: (value) {
                    print((value));
                  },
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    labelText: 'Destino',
                    hintText: 'Ciudad / Departamento / Barrio',
                  ),
                  onChanged: (value) {
                    print((value));
                  },
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var directions = await LocationService().getDirections(
                      _originController.text,
                      _destinationController.text,
                    );
                    _goToPlace(
                      directions['start_location']['lat'],
                      directions['start_location']['lng'],
                      directions['bounds_ne'],
                      directions['bounds_sw'],
                    );
                    _setPolyline(directions['polyline_decoded']);
                    setState(() {
                      totalCost = calculatePrice(directions['polyline_decoded']);
                    });
                  },
                  child: Text('Calcular Precio'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: totalCost > 0
                      ? () {
                    // Redirige a la pantalla "DriversScreen"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DriversScreen()), // Usa el nombre correcto de tu clase de pantalla de conductores
                    );
                  }
                      : null,
                  child: Text('Contactar un Conductor'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(height: 16),
                Text('Precio Total: \$${totalCost.toStringAsFixed(2)} COP', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(
      double lat, double lng, Map<String, dynamic> boundsNe, Map<String, dynamic> boundsSw) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 12),
    ));

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
          northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
        ),
        25,
      ),
    );

    _setMarker(LatLng(lat, lng));
  }

  double calculatePrice(List<PointLatLng> points) {
    double totalDistance = 0.0;
    for (int i = 0; i < points.length - 1; i++) {
      final PointLatLng point1 = points[i];
      final PointLatLng point2 = points[i + 1];
      final double distance = Geolocator.distanceBetween(
          point1.latitude, point1.longitude, point2.latitude, point2.longitude);
      totalDistance += distance;
    }
    double price = totalDistance * pricePerKilometer;
    return price;
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position: point,
        ),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points.map(
              (point) => LatLng(point.latitude, point.longitude),
        ).toList(),
      ),
    );
  }
}
