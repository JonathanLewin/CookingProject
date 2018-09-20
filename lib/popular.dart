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

class PopularPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PopularPageState();
  }
}

class PopularPageState extends State<PopularPage>{

  double _text = 0.0;

    void onChanged(double value){
      setState(() {
        _text = value;   
      });     
    }

  @override
  Widget build(BuildContext context) {

    Widget test(){
      if(_text.toInt() == 0){
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Recipe Difficulty: '),
          new Text('Very Easy', style: TextStyle(fontWeight: FontWeight.bold),)
        ],);
      }else if(_text.toInt() == 25){
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Recipe Difficulty: '),
          new Text('Easy', style: TextStyle(fontWeight: FontWeight.bold),)
        ],);
      }else if(_text.toInt() == 50){
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Recipe Difficulty: '),
          new Text('Medium', style: TextStyle(fontWeight: FontWeight.bold),)
        ],);
      }else if(_text.toInt() == 75){
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Recipe Difficulty: '),
          new Text('Hard', style: TextStyle(fontWeight: FontWeight.bold),)
        ],);
      }else{
        return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Recipe Difficulty: '),
          new Text('Pro Level', style: TextStyle(fontWeight: FontWeight.bold),)
        ],);
      }
    }

    return new Container(
      padding: new EdgeInsets.all(30.0),
      child: new Column(
        children: <Widget>[
          new Container(
           child: test(),
          ),
          new Slider(
            min: 0.0,
            divisions: 4,
            label: 'Difficulty',
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            max: 100.0,
            value: _text,
            onChanged: 
              onChanged
          ),
        ],
      ),
    );
  }
}