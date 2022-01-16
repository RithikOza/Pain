import 'package:painscore/app_screens/slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _just_to_include() {
  //   DatabaseReference _testRef =
  //       FirebaseDatabase.instance.reference().child('test');
  //   _testRef.set('Hello World ${Random().nextInt(100)}');
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Stack(
        children: [
          Container(height: 560, width: 400, color: Colors.transparent),
          Positioned(
              top: 0.0,
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width)),
          Positioned(
              top: 130,
              left: 10,
              child: Center(
                  child: Text('Pain Score', style: TextStyle(fontSize: 30.0)))),
          Positioned(
              top: 180,
              left: 10,
              child: Center(
                  child: Text('How does your knee feel now?',
                      style: TextStyle(fontSize: 22.0)))),
          // Positioned(
          //   top: 420,
          //   left: 15,
          //   child: ButtonTheme(
          //       minWidth: 350,
          //       height: 50,
          //       child: RaisedButton(
          //         onPressed: () {
          //           if(val>0)
          //           _submit ++;
          //           DatabaseReference _testRef =
          //           FirebaseDatabase.instance.reference().child('test');
          //           _testRef.set('Hello World ${Random().nextInt(100)}');
          //           // var set = set;
          //           // _submit.set('Hello World ${Random().nextInt(100)}');
          //
          //           setState(() {
          //
          //             print('$_submit');
          //           });
          //         },
          //         child: Text(' Submit'),
          //         color: Colors.white,
          //         textColor: Colors.black,
          //         shape: RoundedRectangleBorder(
          //             side: BorderSide(color: Colors.black, width: 2),
          //             borderRadius: new BorderRadius.circular(30.0)),
          //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          //       )),
          // ),
          // Positioned(
          //     top: 313,
          //     left: 124,
          //     child: Transform.scale(
          //         scale: 2.7,
          //         child: Container(
          //             height: 110,
          //             width: 110,
          //             child: Row(children: [
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //               Expanded(
          //                   child: Image(image: AssetImage('images/line.png'))),
          //             ])))),
          Positioned(
              // top: 190.0,
              top: 240,
              left: 10,
              child: Container(height: 200, width: 350, child: SliderLabel())),
        ],
      )
    ]);
  }
}
