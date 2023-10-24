import 'dart:async';

import 'package:appscratch/pages/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();


  Set <Marker> _markers = Set<Marker>();
  Set <Polygon> _polygons = Set<Polygon>();
  List <LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;



  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );




  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);




 @override
 void initState(){
   super.initState();
   
   _setMarker(LatLng(37.42796133580664, -122.085749655962));
 }

 void _setMarker(LatLng point){
   setState(() {
     _markers.add(
       Marker(markerId: MarkerId('marker'),
         position: point,
       ),
     );
   });
 }

 void _setPolygon(){
   final String polygonIdVal ='_polygonIdCounter';
   -_polygonIdCounter++;
   
   _polygons.add(
     Polygon(
       polygonId: PolygonId(polygonIdVal),
       points: polygonLatLngs,
       strokeWidth: 2,
       fillColor: Colors.transparent,
     ),

   );
 }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('BMAJMC'),),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                  TextFormField(
                    controller: _originController,
                    decoration: InputDecoration(hintText: 'Origen'),
                    onChanged: (value){print((value));
                    },
                  ),
                  TextFormField(
                    controller: _destinationController,
                    decoration: InputDecoration(hintText: 'Destino'),
                    onChanged: (value){print((value));
                    },
                  ),

                ],),
              ),
              IconButton(
                onPressed: () async{
                  //var place =
                  //await LocationService().getPlace(_searchController.text);
                  //_goToPlace(place);
                },

                icon: Icon(Icons.search),
              ),
            ],
          ),












          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,

              markers: _markers,
              polygons: _polygons,

              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (point){
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();

                });

              },
            ),
          ),
        ],
      ),
      //floatingActionButton: FloatingActionButton.extended(
      //onPressed: _goToTheLake,
      //label: const Text('To the lake!'),
      //icon: const Icon(Icons.directions_boat),
      //),
    );
  }


  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng),zoom: 12 ),
    )
    );

    _setMarker(LatLng(lat, lng));
  }


}