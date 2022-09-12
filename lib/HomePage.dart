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
  var api1 =
      "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";
  var api =
      "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";
  // "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=41dfb5efbf3bb10693aeabd4e355d7a1";
  var res;
  var data;
  var data1;
  var tracks;
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData1();
  }

  void fetchData1() async {
    res = await http.get(Uri.parse(api1));
    data1 = jsonDecode(res.body);
    print(data1);
  }

  void fetchData() async {
    //http.Response response = await http.get(Uri.parse(api));
    res = await http.get(Uri.parse(api));
    data = jsonDecode(res.body);
    print(data);
    //print(data["message"]["body"]["track_list"][0]["track"]["track_name"]);
    setState(() {});
    tracks = data["Industry"];
    print(tracks);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width * 1,
        //height: MediaQuery.of(context).size.height * 1,
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "OverView",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Sector",
                    value: data["Sector"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Industry",
                    value: data["Industry"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Market Cap",
                    value2: data["MCAP"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Enterprise Value(EV)",
                    value2: data["MCAP"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Book Value / Share",
                    value2: data["BookNavPerShare"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Price-Earning Ratio(PE)",
                    value2: data["TTMPE"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "PEG Ratio",
                    value2: data["PEGRatio"],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Resuable_Row(
                    text: "Dividend Yield",
                    value2: data["Yield"],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Performance",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Resuable_Row2(
                  text: "1 day    ",
                  percent: data1[0]["ChangePercent"],
                ),
                SizedBox(
                  height: 10,
                ),
                Resuable_Row2(
                  text: "1 Week ",
                  percent: data1[1]["ChangePercent"],
                ),
                 SizedBox(
                  height: 10,
                ),
                Resuable_Row2(
                  text: "1 Month",
                  percent: data1[2]["ChangePercent"],
                ),
                 SizedBox(
                  height: 10,
                ),
                Resuable_Row2(
                  text: "6 Month",
                  percent: data1[3]["ChangePercent"],
                ),
                 SizedBox(
                  height: 10,
                ),
                Resuable_Row2(
                  text: "1 Year  ",
                  percent: data1[4]["ChangePercent"],
                ),
                 SizedBox(
                  height: 10,
                ),
                Resuable_Row2(
                  text: "2 Year  ",
                  percent: data1[5]["ChangePercent"],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class Resuable_Row2 extends StatelessWidget {
  String? text;
  double? percent;
  Resuable_Row2({this.text, this.percent});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text ?? "",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        Container(
          color: Colors.grey[900],
        constraints: BoxConstraints(maxWidth: 200),
         width: 200,
          height: 30,
          child: Row(
            children: [
              Container(
                color: Colors.green,
                height: 30,
                width: 20,
              ),
            ],
          ),
        ),
        Spacer(),
        Text(
          percent!.toStringAsFixed(2) + "%",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Spacer()
      ],
    );
  }
}

class Resuable_Row extends StatelessWidget {
  String? text;
  String? value;
  double? value2;
  Resuable_Row({this.text, this.value, this.value2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? "",
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        value != null
            ? Text(
                value ?? "",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              )
            : Text(
                "$value2",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              )
      ],
    );
  }
}
