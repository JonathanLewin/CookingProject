import 'package:flutter/material.dart';
import './main.dart';
import './ingredientspage.dart';

class Data {
  const Data(
      {this.pagetext,
      this.url,
      this.foodname,
      this.fooddescription,
      this.cookingtime,
      this.ingredients,
      this.alergies,
      this.difficulty,
      this.stepone,
      this.steptwo,
      this.stepthree,
      this.stepfour,
      this.stepfive,
      this.steponetime,
      this.steptwotime,
      this.stepthreetime,
      this.stepfourtime,
      this.stepfivetime});

  final String pagetext;
  final String url;
  final String foodname;
  final String fooddescription;
  final String cookingtime;
  final String ingredients;
  final String alergies;
  final String difficulty;
  final String stepone;
  final String steptwo;
  final String stepthree;
  final String stepfour;
  final String stepfive;
  final String steponetime;
  final String steptwotime;
  final String stepthreetime;
  final String stepfourtime;
  final String stepfivetime;
}

class DataClass {
  final List<Data> _data = <Data>[
    Data(
        pagetext: 'RECIPIES UNDER £5',
        url: 'assets/carbonara.jpg',
        foodname: 'Pasta Carbonara',
        fooddescription:
            'Deleicious pasta seasoned with a creamy sauce filled with bacon and herbs',
        cookingtime: '25mins',
        alergies: 'DIARY FREE, GLUTEN FREE',
        difficulty: 'LOW',
        ingredients:
            'Spaghetti, 1 clove of Garlic, double wipped cream, diced bacon, mushrooms, mixed herbs',
        stepone:
            'Boil spaghetti for 9mins and while that is cooking, pre heat another frying pan and slice up some mushroom',
        steptwo:
            'Cut up some garlic, add some olive oil to the pre heated pan and once the pan is hot, add the diced bacon',
        stepthree:
            'Let bacon cook on its own for 5mins until slightly crispy, then add the mushrooms',
        stepfour:
            'Let it cook for 5mins and then add the full tub of cream and simmer for another 4mins',
        stepfive:
            'Season with salt and pepper, mix and add the drained pasta. Mix once again.',
        steponetime: '9mins',
        steptwotime: '2mins',
        stepthreetime: '5mins',
        stepfourtime: '5mins',
        stepfivetime: '4mins'),
    Data(
        pagetext: 'AUTHENTIC ASAIN DISHES',
        url: 'assets/bibimbap.jpg',
        foodname: 'Bibimbap',
        fooddescription: 'Lots of vegetables',
        cookingtime: '40mins',
        ingredients:
            'Jasmine Rice, eggs, sliced up pork/chicken/tofu, range of chopped up vegetables, seasoning',
        alergies: 'GLUTEN FREE, VEGAN',
        difficulty: 'MEDIUM',
        stepone:
            'Boil spaghetti for 9mins and while that is cooking, pre heat another frying pan and slice up some mushroom',
        steptwo:
            'Cut up some garlic, add some olive oil to the pre heated pan and once the pan is hot, add the diced bacon',
        stepthree:
            'Let bacon cook on its own for 10mins until slightly crispy, then add the mushrooms',
        stepfour:
            'Let it cook for 5mins and then add the full tub of cream and simmer for another 5mins',
        stepfive:
            'Season with salt and pepper, mix and add the drained pasta. Mix once again.',
        steponetime: '14mins',
        steptwotime: '2mins',
        stepthreetime: '5mins',
        stepfourtime: '5mins',
        stepfivetime: '4mins'),
    Data(
        pagetext: 'AUTHENTIC ASAIN DISHES',
        url: 'assets/katsu.jpg',
        foodname: 'Katsu Curry',
        fooddescription:
            'An authentic asain dish that consists of crispy breaded chicken covered in curry suace',
        cookingtime: '1hr',
        ingredients:
            'Jasmine Rice, chicken breast, flour, breadcrums, eggs, chicken stock, curry suace',
        alergies: 'VEGETARIAN',
        difficulty: 'MEDIUM',
        stepone:
            'Wash rice and put it in the rice cooker. Prepare two cracked eggs, three tablespoons of flour and breadcrums on separate plates, ',
        steptwo:
            'Cut up some garlic, add some olive oil to the pre heated pan and once the pan is hot, add the diced bacon',
        stepthree:
            'Let bacon cook on its own for 10mins until slightly crispy, then add the mushrooms',
        stepfour:
            'Let it cook for 5mins and then add the full tub of cream and simmer for another 5mins',
        stepfive:
            'Season with salt and pepper, mix and add the drained pasta. Mix once again.',
        steponetime: '23mins',
        steptwotime: '2mins',
        stepthreetime: '5mins',
        stepfourtime: '5mins',
        stepfivetime: '4mins'),
  ];

  List<Data> getList() {
    return _data;
  }
}

class PageOne extends StatelessWidget {
  int index = 0;
  final String pagetext;

  PageOne(this.pagetext);

  Widget _dialogbuilder(BuildContext context, Data data) {
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
                    onPressed: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new Ingredients(
                                  'HOW TO MAKE ' + data.foodname,
                                  data.stepone,
                                  data.steptwo,
                                  data.stepthree,
                                  data.stepfour,
                                  data.stepfive,
                                  data.steponetime,
                                  data.steptwotime,
                                  data.stepthreetime,
                                  data.stepfourtime,
                                  data.stepfivetime,
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

  Widget _dialogbuildericon(BuildContext context, Data data) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    int index = 0;

    return new AlertDialog(
      content: new Container(
        width: 300.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.deepOrange),
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: new Text(
                'Dietary Requirements: ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.note), iconSize: 30.0, color: Colors.greenAccent, onPressed: () {}),
                new Text(
                data.alergies,
                textAlign: TextAlign.start,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0, color: Colors.green, fontWeight: FontWeight.bold),
              ),
              ],
            ),
            new Container(
              height: 1.0,
              width: 230.0,
              color: Colors.brown,
              margin: const EdgeInsets.all(3.0),
            ),
            Row(
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.warning), iconSize: 30.0, color: Colors.yellowAccent, onPressed: () {}),
                new Text(
                'DIFFICULTY: ',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),
              ),
                new Text('  ' + data.difficulty, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();
    var oi = 'nxjd';

    int counter = _data.length;

    return new GestureDetector(
      onTap: () => showDialog(
            context: context,
            builder: (context) => _dialogbuilder(context, _data[index]),
          ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
            child: new Column(
              children: <Widget>[
                new Image.asset(_data[index].url,
                    fit: BoxFit.cover, height: 200.0, width: 370.0),
                new SizedBox(height: 8.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new SizedBox(width: 70.0),
                    new Text(_data[index].foodname,
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    new SizedBox(width: 20.0),
                    new IconButton(
                        icon: new Icon(Icons.info, size: 20.0),
                        onPressed: () => showDialog(
                              context: context,
                              builder: (context) =>
                                  _dialogbuildericon(context, _data[index]),
                            ),
                        color: Colors.deepOrange,
                        alignment: Alignment.centerRight),
                  ],
                ),
                //new SizedBox(height: 8.0),
                new Text(_data[index].fooddescription,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 14.0, fontStyle: FontStyle.italic)),
                new SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 20.0,
                    children: [
                      new Text(
                        'Cooking Time: ' + _data[index].cookingtime,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text(pagetext),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
