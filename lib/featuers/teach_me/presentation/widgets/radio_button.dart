import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {
    String radioButtonItem = 'Student';
    int id = 1;
    Widget build(BuildContext context) {
      return Column(
       children: <Widget>[
          // Padding(
          //     padding: EdgeInsets.all(0),
          //     child: Text('Register as ' + '$radioButtonItem',
          //         style: TextStyle(fontSize: 21))
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Student';
                    id = 1;
                  });
                },
              ),
              Text(
                'Student',
                style: new TextStyle(fontSize: 17.0),
              ),

              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Teacher';
                    id = 2;
                  });
                },
              ),
              Text(
                'Teacher',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ],
      );
    }
}