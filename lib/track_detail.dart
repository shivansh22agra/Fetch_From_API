

import 'package:api_music/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class track_detail extends StatefulWidget {
  const track_detail({Key? key}) : super(key: key);

  @override
  State<track_detail> createState() => _track_detailState();
}

class _track_detailState extends State<track_detail> {
  //var api =
    //  "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=41dfb5efbf3bb10693aeabd4e355d7a1";
  //var data, res;
  // var tracks = data["message"]["body"]["track_list"];

  //var api1 =
   //   "https://api.musixmatch.com/ws/1.1/track.get?track_id=${tracks[0]["track"]["track_id"]}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
  @override
 // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // fetchData() async {
  //   res = await http.get(Uri.parse(api1));
  //   data = jsonDecode(res.body);
  //   print(data["message"]["body"]["track"]["track_name"]);
  
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));

          },
          
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        
      ),
    );
  }
}
