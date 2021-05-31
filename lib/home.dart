import 'package:flutter/material.dart';
import 'package:human_generator/drawingarea.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DrawingArea> points = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(138, 35, 135, 1),
                  Color.fromRGBO(255, 64, 87, 1),
                  Color.fromRGBO(242, 113, 33, 1)
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 256,
                    height: 256,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: GestureDetector(
                      // * for detecting drawing
                      onPanDown: (details) {
                        this.setState(
                          () {
                            points.add(
                              DrawingArea(
                                  point: details.localPosition,
                                  areaPaint: Paint()
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true
                                    ..color = Colors.white
                                    ..strokeWidth = 2),
                            );
                          },
                        );
                      },
                      onPanUpdate: (details) {
                        this.setState(
                          () {
                            points.add(
                              DrawingArea(
                                  point: details.localPosition,
                                  areaPaint: Paint()
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true
                                    ..color = Colors.white
                                    ..strokeWidth = 2),
                            );
                          },
                        );
                      },
                      onPanEnd: (details) {
                        this.setState(
                          () {
                            points.add(null);
                          },
                        );
                      },
                      child: SizedBox.expand(
                        // ? sizedbox.expand?
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: CustomPaint(
                            // ? custom paint
                            painter: MyCustomPainter(points: points),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container( 
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          this.setState(() {
                            points.clear(); //* deleting all points
                          });
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
