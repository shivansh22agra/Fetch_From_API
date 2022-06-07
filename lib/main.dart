import 'package:api_music/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// class HomePagee extends StatelessWidget {
//   const HomePagee({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Trending",
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: OfflineBuilder(
//         connectivityBuilder: (
//           BuildContext context,
//           ConnectivityResult connectivity,
//           Widget child,
//         ) {
//           final bool connected = connectivity != ConnectivityResult.none;
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               Positioned(
//                 height: 24.0,
//                 left: 0.0,
//                 right: 0.0,
//                 child: Container(
//                   child: Center(
//                     child: Text("${connected ? 'ONLINE' : 'OFFLINE'}")
//                   ),
//                 ),
//               )
//             ],
//           );
            
//           // return Stack(
//           //    connected
//           //    ? Navigator.push(
//           //         context, MaterialPageRoute(builder: (context) => HomePage()))
//           //     : Center(child: Text("check your internet")));
//         },
        
//       ),
//     );
//   }
// }
