import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './sidebarpages.dart';

class Ingredients extends StatefulWidget {
  final String ingredienttitle;
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

  Ingredients(
      this.ingredienttitle,
      this.stepone,
      this.steptwo,
      this.stepthree,
      this.stepfour,
      this.stepfive,
      this.steponetime,
      this.steptwotime,
      this.stepthreetime,
      this.stepfourtime,
      this.stepfivetime);

  @override
  State<StatefulWidget> createState() {
    return new IngredientsState();
  }
}

class IngredientsState extends State<Ingredients> {
  int stepCounter = 0;
  //final List<DocumentSnapshot> documents;
  //int index;

  //Poo pooclass = new Poo();

  //List<Step> calledList = pooclass.GetList();

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text('Step One'),
        subtitle: Text('Duration: ' + widget.steponetime),
        content: Text(widget.stepone),
        isActive: true,
      ),
      Step(
        title: Text('Step Two'),
        subtitle: Text('Duration: ' + widget.steptwotime),
        content: Text(widget.steptwo),
        isActive: true,
      ),
      Step(
        title: Text('Step Three'),
        subtitle: Text('Duration: ' + widget.stepthreetime),
        content: Text(widget.stepthree),
        isActive: true,
      ),
      Step(
        title: Text('Step Four'),
        subtitle: Text('Duration: ' + widget.stepfourtime),
        content: Text(widget.stepfour),
        isActive: true,
      ),
      Step(
        title: Text('Step Five'),
        subtitle: Text('Duration: ' + widget.stepfivetime),
        content: Text(widget.stepfive),
        isActive: true,
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text(
          widget.ingredienttitle,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0),
        ),
      ),
      body: new Container(
        child: Stepper(
          currentStep: this.stepCounter,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              stepCounter = step;
            });
          },
          onStepCancel: () {
            setState(() {
              stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
            });
          },
          onStepContinue: () {
            setState(() {
              stepCounter < steps.length - 1
                  ? stepCounter += 1
                  : stepCounter = 0;
            });
          },
        ),
      ),
    );
  }
}

// class FireStoreStepView extends StatelessWidget{

//     @override
//     Widget build(BuildContext context){

//       new StreamBuilder(
//           stream: Firestore.instance.collection('foodname').snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return const Text('');
//             return Poo(documents: snapshot.data.documents);
//           }
//     );
//     }
// }
