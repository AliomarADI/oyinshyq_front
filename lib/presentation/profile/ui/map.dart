// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// // import 'flutter_map';


// class MapComponent extends StatefulWidget {

//   @override
//   _MapComponentState createState() => _MapComponentState();
// }

// class _MapComponentState extends State<MapComponent> {

//   // late Showcase showcaseInfo;

//   List<Marker> _markers = [];

//   void getMarkers() async {
//     // showcaseInfo = await ShowcaseService().getShowcase();
//     for(int i = 0; i < showcaseInfo.data.length; i++) {
//       setState(() {
//         _markers.add(
//             Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 rotate: true,
//                 point: latlng.LatLng(double.parse(showcaseInfo.data[i].latitude), double.parse(showcaseInfo.data[i].longitude)),
//                 builder: (ctx) =>
//                     // FontAwesomeIcons.
//                     Icon(
//                       Icons.radio_button_checked,
//                       color: Colors.blue,
//                     )
//             )
//         );
//       });
//     }
//   }


//   @override
//   void initState() {
//     getMarkers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: FlutterMap(
//         options:
//         MapOptions(
//           center: latlng.LatLng(43.238949, 76.889709),
//           zoom: 13.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
//             subdomains: ['tile0', 'tile1', 'tile2', 'tile3'],
//           ),
//           MarkerLayerOptions(
//             markers: [
//               for(var i in _markers)
//                 i,
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 rotate: true,
//                 point: latlng.LatLng(43.238949, 76.889709),
//                 builder: (ctx) =>
//                     Icon(
//                         Icons.person,
//                         color: Colors.blue,
//                     )
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }