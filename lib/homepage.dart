import 'package:flutter/material.dart';
import './sidebarpages.dart';

class HomepagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomepagePageState();
  }
}

class HomepagePageState extends State<HomepagePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    DataClass test;
    test = new DataClass();
    List<Data> _data = test.getList();

    List<DropdownMenuItem<String>> listdrop = [];

    List<String> drop = [
      _data[0].foodname,
      _data[1].foodname,
      _data[2].foodname,
      _data[1].foodname,
      _data[0].foodname
    ];
    
    String selected;

    void loadData() {
      listdrop = [];
      listdrop = drop
          .map((val) => new DropdownMenuItem<String>(
                child: new Text(val),
                value: val,
              ))
          .toList();

      // listdrop.add(new DropdownMenuItem(
      //   child: new Text(_data[index].foodname),
      //   value: 'one',
      // ));
      // index++;
      // listdrop.add(new DropdownMenuItem(
      //   child: new Text(_data[index].foodname),
      //   value: 'two',
      // ));
      // index++;
      // listdrop.add(new DropdownMenuItem(
      //   child: new Text(_data[index].foodname),
      //   value: 'three',
      // ));
    }

    loadData();
    return new Scaffold(
        body: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
          child: new Column(
            children: <Widget>[
              new DropdownButton(
                value: selected,
                items: listdrop,
                hint: new Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
                elevation: 12,
                iconSize: 40.0,
                onChanged: (value) {
                  selected = value;
                  setState(){

                  }
                }
              ),
            ],
          ),
        )
      ],
    ));
  
  }
}
