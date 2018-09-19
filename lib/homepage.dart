import 'package:flutter/material.dart';
import './sidebarpages.dart';
import './ingredientspage.dart';

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
  List searchRecipesArrayurl = new List();
  List searchRecipesArraycooking = new List();
  List searchRecipesArrayingredients = new List();
  List nosuggestion = new List();

  Widget _dialogbuilder(BuildContext context, index) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index = 0;

    return SimpleDialog(
      children: [
        new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  new EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
              child: new Text(
                'Ingredients you will need: ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(15.0),
              child: new Text(
                searchRecipesArrayingredients[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Wrap(
                spacing: 60.0,
                children: [
                  new FlatButton.icon(
                    icon: new Icon(Icons.star),
                    onPressed: () {},
                    // Navigator.push(
                    //       context,
                    //       new MaterialPageRoute(
                    //         builder: (BuildContext context) => new HomepagePage(
                    //               data.url,
                    //               data.foodname,
                    //               data.fooddescription,
                    //               data.cookingtime,
                    //             ),
                    //       ),
                    //     ),
                    label: new Text(
                      'Save me ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  new FlatButton.icon(
                    icon: new Icon(Icons.restaurant),
                    onPressed: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new Ingredients(
                                  'HOW TO MAKE ' + _data[index].foodname,
                                  _data[index].stepone,
                                  _data[index].steptwo,
                                  _data[index].stepthree,
                                  _data[index].stepfour,
                                  _data[index].stepfive,
                                  _data[index].steponetime,
                                  _data[index].steptwotime,
                                  _data[index].stepthreetime,
                                  _data[index].stepfourtime,
                                  _data[index].stepfivetime,
                                ),
                          ),
                        ),
                    label: new Text(
                      'Start Cooking! ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

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
        List tempthree = new List();
        List tempfour = new List();
        List tempfive = new List();
        for (int index = 0; index < _data.length; index++) {
          if (_text
              .toLowerCase()
              .contains(_data[index].foodname.toLowerCase())) {
            print(_text);
            //tempthree.add(_data[index].url);
            temp.add(_data[index].foodname);
            temptwo.add(_data[index].fooddescription);
            tempthree.add(_data[index].url);
            tempfour.add(_data[index].cookingtime);
            tempfive.add(_data[index].ingredients);
            print(searchRecipesArrayname);
            //_filter.clear();
          }
          _filter.clear();
        }
        searchRecipesArrayname = temp;
        searchRecipesArraydescription = temptwo;
        searchRecipesArrayurl = tempthree;
        searchRecipesArraycooking = tempfour;
        searchRecipesArrayingredients = tempfive;
      }
    }

    return new GestureDetector(
      onTap: () => showDialog(
            context: context,
            builder: (context) =>
                _dialogbuilder(context, searchRecipesArrayingredients[index]),
          ),
      child: new SingleChildScrollView(
        child: new Container(
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
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  highlightElevation: 50.0,
                  elevation: 4.0,
                  onPressed: () {
                    setState(() {
                      onPressedd();
                      print('yes');
                    });
                  }),
              new ListView.builder(
                  itemCount: searchRecipesArrayname == null
                      ? 0
                      : searchRecipesArrayname.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return new SingleChildScrollView(
                      child: new Container(
                        padding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 45.0),
                        child: new Column(
                          children: <Widget>[
                            new Image.asset(searchRecipesArrayurl[index],
                                fit: BoxFit.cover, height: 200.0, width: 370.0),
                            new SizedBox(height: 8.0),
                            new Text(searchRecipesArrayname[index],
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            new SizedBox(height: 8.0),
                            new Text(searchRecipesArraydescription[index],
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                            new SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.center,
                              child: Wrap(
                                spacing: 20.0,
                                children: [
                                  new Text(
                                    'Cooking Time: ' +
                                        searchRecipesArraycooking[index],
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );

    //title: new Text(searchRecipesArrayname[index]),
    //subtitle: new Text(searchRecipesArraydescription[index]),
    //onTap: () => showDialog(
    //context: context,
    //builder: (context) => _dialogbuilder(context, searchRecipesArrayname[index]),
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
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
