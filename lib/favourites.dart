import 'package:flutter/material.dart';
import './sidebarpages.dart';

// class FavouritePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new FavouritePageState();
//   }
// }

// //DataClass test;
// DataClass test = new DataClass();
// List<Data> _data = test.getList();

// class FavouritePageState extends State<FavouritePage> {
//   List<Container> gridlist = new List();

//   // DataClass test;
//   // test = new DataClass();
//   // List<Data> _data = test.getList();

//   _buildlist() {
//     for (int i = 0; i < _data.length; i++) {
//       final listindex = _data[i];
//       gridlist.add(
//         new Container(
//           child: new Text(listindex.foodname),
//         ),
//       );
//     }
//   }

//   @override
//   void initstate() {
//     _buildlist();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new GridView.count(
//         crossAxisCount: 2,
//         children: gridlist,
//       ),
//     );
//   }
// }

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TheGridView().build(),
    );
  }
}

class TheGridView {

   Widget makeGridCell(
      String urltype, String foodnametype, String cookingtimetype) {

    BuildContext context;
    int index;
    DataClass test;
    test = new DataClass(); 
    List<Data> _data = test.getList();
    
    return new Card(
      elevation: 7.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Image.asset(urltype,
              fit: BoxFit.cover, height: 140.0, width: 150.0),
          new SizedBox(height: 6.0),
          new Text(foodnametype,
              textAlign: TextAlign.center,
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          new SizedBox(height: 3.0),
          new Text('Cooking Time: ' + cookingtimetype,
              textAlign: TextAlign.center,
              style:
                  new TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  GridView build() {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index = 0;

    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(16.0),
      crossAxisCount: 2,
      childAspectRatio: 0.92,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: <Widget>[
        makeGridCell(_data[0].url, _data[0].foodname, _data[0].cookingtime),
        makeGridCell(_data[1].url, _data[1].foodname, _data[1].cookingtime),
        makeGridCell(_data[2].url, _data[2].foodname, _data[2].cookingtime),
        makeGridCell(_data[0].url, _data[0].foodname, _data[0].cookingtime),
        makeGridCell(_data[1].url, _data[1].foodname, _data[1].cookingtime),
        makeGridCell(_data[2].url, _data[2].foodname, _data[2].cookingtime),
      ],
    );
  }
}
