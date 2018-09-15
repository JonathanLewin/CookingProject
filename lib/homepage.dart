import 'package:flutter/material.dart';
import './sidebarpages.dart';

class HomepagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomepagePageState();
  }
}

class HomepagePageState extends State<HomepagePage> {
  String _text;

  final TextEditingController _filter = new TextEditingController();
  List searchRecipesArrayname = new List();
  List searchRecipesArraydescription = new List();
  //List searchRecipesArrayurl = new List();

  void onChanged(String item) {
    _text = item;
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();

    void onPressedd() {

      if (!(_text.isEmpty)) {
        List temp = new List();
        List temptwo = new List();
        //List tempthree = new List();
        for (int index = 0; index < _data.length; index++) {
          if (_text.toLowerCase() == _data[index].foodname.toLowerCase()) {
            print(_text);
            //tempthree.add(_data[index].url);
            temp.add(_data[index].foodname);
            temptwo.add(_data[index].fooddescription);
            print(searchRecipesArrayname);
            //_filter.clear();
          }
          _filter.clear();
        }
        searchRecipesArrayname = temp;
        searchRecipesArraydescription = temptwo;
        //searchRecipesArrayurl = tempthree;
      }
    }

    return new Container(
      padding: new EdgeInsets.all(25.0),
      child: new Column(
        children: <Widget>[
          new TextField(
            keyboardType: TextInputType.text,
            //autofocus: true,
            controller: _filter,
            autocorrect: true,
            onChanged: (String item) {
              onChanged(item);
              //print('gets changed');
            },
            decoration: new InputDecoration(
              hintText: 'Search for a Recipe',
              icon: new Icon(Icons.search),
            ),
          ),
          new RaisedButton(
              padding: new EdgeInsets.all(11.0),
              child: new Text('Find Recipe!'),
              color: Colors.deepOrange,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
              highlightElevation: 50.0,
              elevation: 4.0,
              onPressed: () {
                setState(() {
                  onPressedd();
                  print('yes');
                });
              }),
          new ListView.builder(
            itemCount:
                searchRecipesArrayname == null ? 0 : searchRecipesArrayname.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: new Text(searchRecipesArrayname[index]),
                subtitle: new Text(searchRecipesArraydescription[index]),
                //title: new Image.asset(searchRecipesArrayurl[index], fit: BoxFit.cover, height: 100.0, width: 170.0),
                onTap: () => print(searchRecipesArrayname[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

// List<DropdownMenuItem<String>> listdrop = [];

// List<String> drop = [
//   _data[0].foodname,
//   _data[1].foodname,
//   _data[2].foodname,
//   _data[1].foodname,
//   _data[0].foodname
// ];

// String selected;

// void loadData() {
//   listdrop = [];
//   listdrop = drop
//       .map((val) => new DropdownMenuItem<String>(
//             child: new Text(val),
//             value: val,
//           ))
//       .toList();

//   // listdrop.add(new DropdownMenuItem(
//   //   child: new Text(_data[index].foodname),
//   //   value: 'one',
//   // ));
//   // index++;
//   // listdrop.add(new DropdownMenuItem(
//   //   child: new Text(_data[index].foodname),
//   //   value: 'two',
//   // ));
//   // index++;
//   // listdrop.add(new DropdownMenuItem(
//   //   child: new Text(_data[index].foodname),
//   //   value: 'three',
//   // ));
// }

// loadData();
// return new Scaffold(
//     body: new Row(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: <Widget>[
//     new Container(
//       padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
//       child: new Column(
//         children: <Widget>[
//           new DropdownButton(
//             value: selected,
//             items: listdrop,
//             hint: new Text(
//               'Filter',
//               style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.black,
//                   fontStyle: FontStyle.italic),
//             ),
//             elevation: 13,
//             iconSize: 40.0,
//             onChanged: (value) {
//               selected = value;
//               setState(){

//               }
//             }
//           ),
//         ],
//       ),
//     )
//   ],
// ));
