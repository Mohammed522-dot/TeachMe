import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerSection extends StatelessWidget{
  List<dynamic> workers = [
    ['Alfredo Schafer', 'Plumber', 'teacher1.jpg', 4.8],
    ['Michelle Baldwin', 'Cleaner', 'teacher1.jpg', 4.6],
    ['Brenon Kalu', 'Driver', 'teacher1.jpg', 4.4]
  ];
  @override
Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workers.length,
        itemBuilder: (BuildContext context, int index) {

        return GestureDetector(
          child: AspectRatio(
            aspectRatio: 3.5,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(workers[index]["Image"])
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(workers[index]["name"], style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(workers[index]["jop"], style: TextStyle(fontSize: 15),)
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(workers[index]["rating"].toString(), style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Icon(Icons.star, color: Colors.orange, size: 20,)
                      ],
                    )
                  ]
              ),
            ),
          ),

        );

      }
    );
  }
}