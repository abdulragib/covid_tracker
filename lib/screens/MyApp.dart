// ignore: file_names
// ignore_for_file: file_names
import '../Networking.dart';
import 'package:covid_tracker/Reusuable.dart';
import "package:flutter/material.dart";

import '../ReusuableWidgetTwo.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var TextOne = 'World Data';
  var covidData;
  var covidDataOne;

  @override
  void initState() {
    super.initState();
    callApi();
    CallApiOne();
  }

  Future callApi() async {
    // for world
    final dataOne = data();
    covidData = await dataOne.getSummryData();
    setState(() {});
  }

  Future CallApiOne() async {
    // for country
    final dataOne = data();
    covidDataOne = await dataOne.getCountryData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: covidData == null
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white60,
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: Center(
                  child: Text("$TextOne",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFfafafa),
                          icon: Icon(Icons.coronavirus, color: Colors.white),
                          hintText: "Enter Country or State Name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            TextOne = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        for (var i = 0; i < covidDataOne.length; i++) {
                          if (TextOne == covidDataOne[i]['country']) {
                            covidData = covidDataOne[i];
                          }

                        }
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 17),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 5),
                        primary: Colors.white60,
                      ),
                      child: const Text(
                        'Get Data',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        ReuseableWidget(
                          width: 180.0,
                          height: 80.0,
                          childCard: DataWidget(
                              text: "Total Cases",
                              covidData: "${covidData['cases']}"),
                        ),
                        ReuseableWidget(
                          width: 180.0,
                          height: 80.0,
                          childCard: DataWidget(
                              text: "Total Deaths",
                              covidData: "${covidData['deaths']}"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ReuseableWidget(
                          width: 210.0,
                          height: 290.0,
                          childCard: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10.0, bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[


                                itemWidget(
                                  text: "Today Deaths",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "Today Cases",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "Active Cases",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "Critical Condition",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "Population",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "Tests",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "CasesPerOneMillion",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                itemWidget(
                                  text: "DeathsPerOneMillion",
                                ),
                              ],
                            ),
                          ),
                        ),
                        ReuseableWidgetTwo(
                          width: 150.0,
                          height: 290.0,
                          childCardTwo: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                itemWidgetTwo(
                                  covidDataOne: "${covidData['todayDeaths']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne: "${covidData['todayCases']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne: "${covidData['active']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne: "${covidData['critical']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne: "${covidData['population']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne: "${covidData['tests']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne:
                                      "${covidData['casesPerOneMillion']}",
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                itemWidgetTwo(
                                  covidDataOne:
                                      "${covidData['deathsPerOneMillion']}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        ReuseableWidget(
                          width: 180.0,
                          height: 80.0,
                          childCard: DataWidget(
                              text: "Total Recovered",
                              covidData: "${covidData['recovered']}"),
                        ),
                        ReuseableWidget(
                          width: 180.0,
                          height: 80.0,
                          childCard: DataWidget(
                              text: "Today Recovered",
                              covidData: "${covidData['todayRecovered']}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class itemWidget extends StatelessWidget {
  final covidDataOne;
  final text;
  final padding;
  itemWidget({this.covidDataOne, this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Text(
          "$text",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ]);
  }
}

class itemWidgetTwo extends StatelessWidget {
  final covidDataOne;
  final text;
  final padding;
  itemWidgetTwo({this.covidDataOne, this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        "$covidDataOne",
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  final text;
  final covidData;
  DataWidget({
    this.covidData,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              "$text",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$covidData",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
