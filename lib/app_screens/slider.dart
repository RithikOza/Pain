import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:painscore/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class SliderLabel extends StatefulWidget {
  // const SliderLabel({Key? key}) : super(key: key);

  @override
  _SliderLabelState createState() => _SliderLabelState();
  // SliderLabel({this.app});
  // final FirebaseApp app;

}

class _SliderLabelState extends State<SliderLabel> {
  late final dref = FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;
  setData() {
    DatabaseReference _range =
        FirebaseDatabase.instance.reference().child('test');
    _range.set('The Pain is: ${rangecalculator()}');
  }

  // showData() {
  //   dref.once().then((snapshot) {
  //     print(snapshot);
  //   });
  // }

  // final referenceDatabase = FirebaseDatabase.instance;
  int indexTop = 0;
  double valueBottom = 20;
  double range = 0.0;

  rangecalculator() {
    if (range > 0.0) {
      // print('Pain');
      if (range <= 8) {
        if (range <= 4) {
          return ('Mild ');
        } else {
          return ('Moderate ');
        }
      } else {
        return ('Severe ');
      }
    } else {
      return ('No Pain');
    }
  }

  // DatabaseReference _rangeRef=0;
  @override

  // void initState() {
  //   final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
  //   _rangeRef = database.reference().child('PainScore');
  //   super.initState();

  Widget build(BuildContext context) {
    return SliderTheme(
      // final ref = referenceDatabase.reference();

      data: const SliderThemeData(
        /// ticks in between
        activeTickMarkColor: Colors.black,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
        thumbColor: Colors.black,
        inactiveTickMarkColor: Colors.black,
        activeTrackColor: Colors.black,
        inactiveTrackColor: Colors.black26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 16),
          buildSliderTopLabel(),
        ],
      ),
    );
  }

  Widget buildSliderTopLabel() {
    // final ref = referenceDatabase.reference();
    final labels = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '+'
    ];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Container(
        height: 200,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: Utils.modelBuilder(
                  labels,
                  (index, label) {
                    const selectedColor = Colors.black;
                    final unselectedColor = Colors.black.withOpacity(0.3);
                    final isSelected = index <= range;
                    final color = isSelected ? selectedColor : unselectedColor;

                    return buildLabel(
                        color: color, width: 20, label: label.toString());
                  },
                ),
              ),
            ),
            Slider(
                label: range.abs().toString(),
                value: range,
                min: min,
                max: max,
                divisions: divisions,
                // label: labels[indexTop],
                onChanged: (val) => setState(() {
                      range = val;
                    })),
            // Flexible(
            //     // ignore: unnecessary_new
            //     child: new FirebaseAnimatedList(
            //         query: _rangeRef,
            //         itemBuilder: (BuildContext context,
            //             DataSnapshot snapshot,
            //             Animation<double> animation,
            //             int index) {
            //           return ListTile(
            //               // title: Text(snapshot.value['Pain']),
            //               );
            //         })),
            ButtonTheme(
                minWidth: 350,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    setData();
                    // ref
                    //     .child('PainScore')
                    //     .push()
                    //     .child('Pain')
                    //     .set(rangecalculator())
                    //     .asStream();
                  },
                  child: Text('Submit'),
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                      borderRadius: new BorderRadius.circular(30.0)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                )),
            // FlatButton(onPressed: showData(), child: Text('finish'))
          ],
        ));
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: 20,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
}
