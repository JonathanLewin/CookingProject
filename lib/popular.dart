import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './sidebarpages.dart';

// class PopularPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: StreamBuilder(
//           stream: Firestore.instance.collection('foodname').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return const Text('');
//             return FireStoreListView(documents: snapshot.data.documents);
//           }),
//     );
//   }
// }

// class FireStoreListView extends StatelessWidget {
//   final List<DocumentSnapshot> documents;
//   int index = 0;

//   FireStoreListView({this.documents});

//   @override
//   Widget build(BuildContext context) {
//     String name = documents[1].data['name'].toString();
//     String cookingtime = documents[1].data['cookingtime'].toString();
//     String url = documents[1].data['url'].toString();
//     String updatetime = '3hrs';

//     return new SingleChildScrollView(
//       child: new Column(
//         children: <Widget>[
//           new Container(
//             margin: const EdgeInsets.all(6.0),
//             decoration: new BoxDecoration(
//                 border: new Border.all(width: 1.5, color: Colors.grey)),
//             padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//             child: new Column(
//               children: <Widget>[
//                 new Image.asset(url,
//                     fit: BoxFit.cover, height: 200.0, width: 370.0),
//                 new SizedBox(height: 8.0),
//                 new Text(name,
//                     textAlign: TextAlign.center,
//                     style: new TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic)),
//                 new SizedBox(height: 8.0),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Wrap(
//                     spacing: 18.0,
//                     children: [
//                       new Text(
//                         'Updated ' + updatetime + ' ago' + '     |',
//                         textAlign: TextAlign.left,
//                         style: new TextStyle(
//                             fontSize: 11.0,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.blue),
//                       ),
//                       new Text('Cooking Time: ' + cookingtime,
//                           textAlign: TextAlign.right)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PopularPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PopularPageState();
  }
}

class PopularPageState extends State<PopularPage> {
  double _difficulty = 0.0;
  double _time = 0.0;
  String veasy;
  String easy = 'Easy';
  String medium = 'medium';
  String hard = 'hard';
  String vhard = 'Very Hard';
  int timeone = 10;
  int timetwo = 25;
  int timethree = 50;
  int timefour = 51;
  List searchRecipesArraycookingtime = new List();

  void onChangeddifficulty(double value) {
    setState(() {
      _difficulty = value;
    });
  }

  void onChangedtime(double value) {
    setState(() {
      _time = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index;

    Widget difficultyDivisions() {
      if (_difficulty.toInt() == 0) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Recipe Difficulty: '),
            new Text(
              'Very Easy',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else if (_difficulty.toInt() == 25) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Recipe Difficulty: '),
            new Text(
              'Easy',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else if (_difficulty.toInt() == 50) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Recipe Difficulty: '),
            new Text(
              'Medium',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else if (_difficulty.toInt() == 75) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Recipe Difficulty: '),
            new Text(
              'Hard',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Recipe Difficulty: '),
            new Text(
              'Pro Level',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      }
    }

    Widget timeDivisions() {
      if (_time.toInt() == 0) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Time to Make:  '),
            //new Text('Very Easy', style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        );
      } else if (_time.toInt() == 25) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Time to Make:  '),
            new Text(
              '<' + timeone.toString() + 'mins',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      } else if (_time.toInt() == 50) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Time to Make:  '),
            new Text(
              '<' + timetwo.toString() + 'mins',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else if (_time.toInt() == 75) {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Time to Make:  '),
            new Text(
              '<' + timethree.toString() + 'mins',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      } else {
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Time to Make:  '),
            new Text(
              '<' + timefour.toString() + 'mins',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        );
      }
    }

    // void action() {
    //   if (_data[index].cookingtime <= timeone) {
    //     List temp = new List();
    //     for (int index = 0; index < _data.length; index++) {
    //       temp.add(_data[index].cookingtime);
    //     }
    //     searchRecipesArraycookingtime = temp;
    //   } else if (_data[index].cookingtime <= timetwo) {
    //     List temptwo = new List();
    //     for (int index = 0; index < _data.length; index++) {
    //       temptwo.add(_data[index].cookingtime);
    //     }
    //     searchRecipesArraycookingtime = temptwo;
    //   } else if (_data[index].cookingtime <= timethree) {
    //     List tempthree = new List();
    //     for (int index = 0; index < _data.length; index++) {
    //       tempthree.add(_data[index].cookingtime);
    //     }
    //     searchRecipesArraycookingtime = tempthree;
    //   } else if (_data[index].cookingtime >= timefour) {
    //     List tempfour = new List();
    //     for (int index = 0; index < _data.length; index++) {
    //       tempfour.add(_data[index].cookingtime);
    //     }
    //     searchRecipesArraycookingtime = tempfour;
    //   }
    // }

    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: difficultyDivisions(),
          ),
          new Slider(
              min: 0.0,
              divisions: 4,
              label: 'Difficulty',
              activeColor: Colors.green,
              inactiveColor: Colors.red,
              max: 100.0,
              value: _difficulty,
              onChanged: onChangeddifficulty),
          new SizedBox(
            height: 22.0,
          ),
          new Container(
            child: timeDivisions(),
          ),
          new Slider(
              min: 0.0,
              divisions: 4,
              label: 'Time',
              activeColor: Colors.green,
              inactiveColor: Colors.red,
              max: 100.0,
              value: _time,
              onChanged: onChangedtime),
          new RaisedButton(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Search'),
            color: Colors.deepOrange,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
            highlightElevation: 50.0,
            elevation: 4.0,
            onPressed: () {
              setState(() {
                //action();
              });
            },
          ),
          // new ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
                // new Container(
                //   child: new Column(
                //     children: <Widget>[
                //       new Image.asset(_data[index].url,
                //           fit: BoxFit.cover, height: 200.0, width: 370.0),
                //       new SizedBox(height: 8.0),
                //       new Text(_data[index].foodname,
                //           textAlign: TextAlign.center,
                //           style: new TextStyle(
                //               fontSize: 20.0,
                //               fontWeight: FontWeight.bold,
                //               fontStyle: FontStyle.italic)),
                //       new SizedBox(height: 8.0),
                //       new Text(_data[index].fooddescription,
                //           textAlign: TextAlign.center,
                //           style: new TextStyle(
                //               fontSize: 14.0, fontStyle: FontStyle.italic)),
                //       new SizedBox(height: 8.0),
                //       Align(
                //         alignment: Alignment.center,
                //         child: Wrap(
                //           spacing: 20.0,
                //           children: [
                //             new Text(
                //               'Cooking Time: ' +
                //                   searchRecipesArraycookingtime.toString(),
                //               style: TextStyle(fontStyle: FontStyle.italic),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              // }),
        ],
      ),
    );
  }
}
