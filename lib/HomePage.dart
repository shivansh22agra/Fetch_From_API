import 'dart:convert';

import 'package:api_music/track_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=41dfb5efbf3bb10693aeabd4e355d7a1";
  var res;
  var data;
  var tracks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    //http.Response response = await http.get(Uri.parse(api));
     res = await http.get(Uri.parse(api));
     data = jsonDecode(res.body);
    print(data);
    //print(data["message"]["body"]["track_list"][0]["track"]["track_name"]);
    setState(() {});
     tracks = data["message"]["body"]["track_list"];
    print(tracks.length);
  }

  

  Widget build(BuildContext context) {
    //fetchData();
    //tracks = data["message"]["body"]["track_list"];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Trending",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: tracks != null?
       ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.queue_music),
              title: Text(
                "${tracks[index]["track"]["track_name"]}",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text("${tracks[index]["track"]["album_name"]}"),
              trailing: Text("${tracks[index]["track"]["artist_name"]}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => track_detail(),
                        fullscreenDialog: true));
              },
            );
          },
         ): Center(
        child: CircularProgressIndicator(
          color: Colors.black,
          )
          
        ),
    );
  }
}

