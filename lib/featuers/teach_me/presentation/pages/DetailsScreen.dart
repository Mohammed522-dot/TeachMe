import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF2F8FF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/teacher1.jpg"),
                  fit: BoxFit.cover,
                ),
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(20),
               bottomRight: Radius.circular(20),
             ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.9),
                      Colors.blue.withOpacity(0),
                      Colors.blue.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                       padding: EdgeInsets.only(top: 30,left: 10,right: 10
                       ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         InkWell(
                           onTap: (){
                             Navigator.pop(context);
                           },
                           child: Container(
                             margin: EdgeInsets.all(8),
                             height: 45,
                             width: 45,
                             decoration: BoxDecoration(
                               color: Color(0xFFF2F8FF),
                               borderRadius: BorderRadius.circular(10),

                             ),
                             child: Center(
                               child: Icon(Icons.arrow_back,color:Colors.blue,size: 28,),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                   SizedBox(height: 80,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                           Text(
                             "Students",
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                             ),
                           ),
                           SizedBox(height: 8,),
                           Text(
                             "1.8k",
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                               color: Colors.white,
                             ),
                           ),
                         ],
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                           Text(
                             "Experience",
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                             ),
                           ),
                           SizedBox(height: 8,),
                           Text(
                             "7 yr",
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                               color: Colors.white,
                             ),
                           ),
                         ],
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                           Text(
                             "Rating",
                             style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                             ),
                           ),
                           SizedBox(height: 8,),
                           Text(
                             "4.9",
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                               color: Colors.white,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "T.Loony",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Row(
                    children: [
                      Icon(Icons.library_books,color: Colors.green,size: 28,),
                      SizedBox(width: 5,),
                      Text(
                        "Math",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),

                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Lorem Ipsum has been the industry's"" standard dummy text ever since the",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Book Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
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

}