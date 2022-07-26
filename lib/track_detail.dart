import 'dart:convert';

import 'package:api_music/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class track_detail extends StatefulWidget {
  // const track_detail({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<track_detail> createState() => _track_detailState();
}

class _track_detailState extends State<track_detail> {
  var api =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=41dfb5efbf3bb10693aeabd4e355d7a1";
  var res, data,tracks,lyric;
  var lyrics =
      "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=161013321&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
  var response, dataa;
  //_track_detailState(this.index);

  @override
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    res = await http.get(Uri.parse(api));
    response = await http.get(Uri.parse(lyrics));
    dataa = jsonDecode(response.body);
    data = jsonDecode(res.body);
    //print(data["message"]["body"]["track_list"][0]["track"]["track_name"]);
    setState(() {});
      tracks = data["message"]["body"]["track_list"];
    lyric = dataa["message"]["body"];

  }

  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: res != null
          ? Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 55),
                  child: Text("${tracks[0]["track"]["track_name"]}"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 95),
                  child: Text(
                    "Artist",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 120),
                  child: Text("${tracks[0]["track"]["artist_name"]}"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 140),
                  child: Text(
                    "Album name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 165),
                  child: Text("${tracks[0]["track"]["album_name"]}"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 185),
                  child: Text(
                    "Explicit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 210),
                  child: Text("${tracks[0]["track"]["explicit"]}"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 230),
                  child: Text(
                    "Rating",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 255),
                  child: Text("${tracks[0]["track"]["rating"]}"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 280),
                  child: Text(
                    "Lyrics",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, top: 310),
                  child: Text("${lyric["lyrics"]["lyrics_body"]}"),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
    );
  }
}
