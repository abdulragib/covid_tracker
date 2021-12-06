import 'package:flutter/material.dart';
import '../Networking.dart';
import '../Reusuable.dart';

class state extends StatefulWidget {
  const state({Key? key}) : super(key: key);

  @override
  _stateState createState() => _stateState();
}

class _stateState extends State<state> {
  var TextOne = "State Data";
  var covidDataTwo;
  var covidDataThree;
  var i;

  @override
  void initState() {
    super.initState();
    CallApiTwo();
  }

  Future CallApiTwo() async {
    // for state
    final dataOne = data();
    covidDataTwo = await dataOne.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: covidDataTwo == null
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white60,
              body: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 5.0),
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
                      for (i = 0; i < covidDataTwo.length; i++) {
                        if (TextOne ==
                            covidDataTwo['data']['regional'][i]['loc']) {
                          covidDataThree = covidDataTwo['data']['regional'][i];
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
                    height: 10,
                  ),
                  ReuseableWidget(
                    width: 350.0,
                    height: 60.0,
                    childCard: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$TextOne",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${covidDataThree['confirmedCasesIndian']}"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
    );
  }
}
