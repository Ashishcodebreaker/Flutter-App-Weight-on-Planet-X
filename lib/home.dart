import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return new HomeState();
  }
}
class HomeState extends State<Home>{
  final TextEditingController _weightController = new TextEditingController();
  int radiovalue = 0;
  double _finalResult = 0.0;
  void handleRadioValueChanged(int value){
    setState(() {
      radiovalue = value;
      switch (radiovalue){
        case 0:
          _finalResult = calculateWeight( _weightController.text,0.06);
          break;
        case 1:
          _finalResult = calculateWeight( _weightController.text,0.38);
          break;
        case 2:
          _finalResult = calculateWeight( _weightController.text,0.91);

      }
    });

  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'asset/planet.png',
            height: 133.0,
              width: 200.0,


            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'in kg',
                      icon: new Icon(Icons.person_outline),
                    ),

                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  // three radio button
                  new  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio button
                      new Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,groupValue: radiovalue,onChanged: handleRadioValueChanged,

                      ),
                      new Text(
                        'Pluto',
                        style: new TextStyle(color: Colors.white30),
                      ),
                      //radio button
                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1,groupValue: radiovalue,onChanged:  handleRadioValueChanged,
                      ),
                      new Text(
                        'Mars',
                        style: new TextStyle(color: Colors.white30),
                      ),
                      //radio button
                      new Radio<int>(
                        activeColor: Colors.deepOrange,
                        value: 2,groupValue: radiovalue,onChanged:  handleRadioValueChanged,
                      ),
                      new Text(
                        'Venus',
                        style: new TextStyle(color: Colors.white30),
                      ),

                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  new Text("$_finalResult",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight,  double multiplier) {
    if (int.parse(weight).toString().isNotEmpty&&int.parse(weight)>0){
      return int.parse(weight)*multiplier;
    }
    else{
      print("wrong");
      return int.parse("180")*0.38;

    }
  }
}