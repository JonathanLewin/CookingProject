import 'package:flutter/material.dart';
import './sidebarpages.dart';
import './ingredientspage.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();

    return new Scaffold(
      body: _build(context),
    //   ListView.builder(
    //     itemCount: _data.length,
    //     itemBuilder: _build,
    // ),
    );
  }
}

  Widget _dialogbuilder(BuildContext context, Data data) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    //int index = 0;

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
                data.ingredients,
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
                    // onPressed: () => Navigator.of(context).push(
                    //       new MaterialPageRoute(
                    //         builder: (BuildContext context) => new Ingredients(
                    //               'HOW TO MAKE ' + data.foodname,
                    //               data.stepone,
                    //               data.steptwo,
                    //               data.stepthree,
                    //               data.stepfour,
                    //               data.stepfive,
                    //               data.steponetime,
                    //               data.steptwotime,
                    //               data.stepthreetime,
                    //               data.stepfourtime,
                    //               data.stepfivetime,
                    //             ),
                    //       ),
                    //     ),
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

  Widget makeGridCell() {

    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index;

    for(index = 0; index < _data.length; index++){
    return new Card(
      elevation: 7.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Image.asset(_data[index].url,
              fit: BoxFit.cover, height: 140.0, width: 150.0),
          new SizedBox(height: 6.0),
          new Text(_data[index].foodname,
              textAlign: TextAlign.center,
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          new SizedBox(height: 3.0),
          new Text('Cooking Time: ' + _data[index].cookingtime,
              textAlign: TextAlign.center,
              style:
                  new TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
  }

  Widget _build(BuildContext context) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index = 0;
    //for (index = 0; index < _data.length; index++) {
      return new GestureDetector(
        onTap: () => showDialog(
              context: context,
              builder: (context) => _dialogbuilder(context, _data[index]),
            ),
        child: GridView.count(
          primary: true,
          padding: EdgeInsets.all(12.0),
          crossAxisCount: 2,
          childAspectRatio: 0.92,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          children: <Widget>[
            makeGridCell(),
            //index = 0,
          ],
        ),
      );
    }
  //}


// makeGridCell(_data[index].url, _data[index].foodname, _data[index].cookingtime),
//         makeGridCell(_data[index].url, _data[index+1].foodname, _data[index+1].cookingtime),
//         makeGridCell(_data[2].url, _data[2].foodname, _data[2].cookingtime),
//         makeGridCell(_data[0].url, _data[0].foodname, _data[0].cookingtime),
//         makeGridCell(_data[1].url, _data[1].foodname, _data[1].cookingtime),
//         makeGridCell(_data[2].url, _data[2].foodname, _data[2].cookingtime),
