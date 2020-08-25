import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current = 0;

  final List<int> list = [0, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: '  On Demand\n',
                  style: TextStyle(
                    color: Color(0xFF4B5C80),
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(
                      text: '|',
                      style: TextStyle(
                        color: Color(0xFF658B36),
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' General Physician',
                      style: TextStyle(
                        color: Color(0xFF086880),
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (_, index) {
                return Image.asset(
                  'images/image${index + 1}.png',
                  fit: BoxFit.fill,
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 400,
                  onPageChanged: (index, _) {
                    setState(() {
                      current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.map((e) {
              int index = e;
              return Container(
                width: 16.0,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color(0xFF01A7E5),
              child: Text('Continue'),
              textColor: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
