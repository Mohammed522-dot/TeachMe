
import 'package:flutter/material.dart';
import 'package:teachme/core/FadeAnimation.dart';
import 'package:teachme/core/classes/language_constants.dart';
import 'package:teachme/featuers/teach_me/data/datasourse/models/Service.dart';
import 'package:teachme/featuers/teach_me/data/datasourse/models/data.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/login_page.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/TeacherSection.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/category_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service> services = [
    Service('Cleaning', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Plumber', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Electrician', 'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service('Painter', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Gardener', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
  ];

  List<dynamic> workers = [
    ['Alfredo Schafer', 'Plumber', 'teacher1.jpg', 4.8],
    ['Michelle Baldwin', 'Cleaner', 'teacher1.jpg', 4.6],
    ['Brenon Kalu', 'Driver', 'teacher1.jpg', 4.4]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Dashboard', style: TextStyle(color: Colors.black),),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: Colors.grey.shade700, size: 30,),
            )
          ],
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://uifaces.co/our-content/donated/NY9hnAbp.jpg'),
                ),
              )
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  // FadeAnimation(1,
                      Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        TextButton(
                            onPressed: () {},
                            child: Text('View all',)
                        )
                      ],
                    ),
                  ),
    //),
                  // FadeAnimation(1.2,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0, 4),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network('https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb', width: 70,)
                              ),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Isabel Kirkland", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Text("Cleaner", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: Center(child: Text('View Profile', style: TextStyle(color: Colors.white, fontSize: 18),)),
                          )
                        ],
                      ), 
                    ),
                  ),
    //),
                  SizedBox(height: 20,),
                  // FadeAnimation(1.3,
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translation(context).topics, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        TextButton(
                            onPressed: () {},
                            child: Text('View all',)
                        )
                      ],
                    ),
                  ),
                      //  ),
        getCategories(),
                  Column(

    //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                 height: 300,
    //                 child: GridView.builder(
    //                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 3,
    //                       childAspectRatio: 1.0,
    //                       crossAxisSpacing: 10.0,
    //                       mainAxisSpacing: 10.0,
    //                     ),
    //                     physics: NeverScrollableScrollPhysics(),
    //                     itemCount: services.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       // return FadeAnimation((1.0 + index) / 4,
    // serviceContainer(services[index].imageURL, services[index].name, index);
    // //);
    //                     }
    //                 ),
                  ),
                  SizedBox(height: 20,),
                  // FadeAnimation(1.3,
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translation(context).topTeachers, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        TextButton(
                            onPressed: () {},
                            child: Text('View all',)
                        )
                      ],
                    ),

                  //)
    ),
                  Container(
                      child: TeacherSection()
            //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //         height: 120,
            //         child: ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             itemCount: workers.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               // return FadeAnimation((1.0 + index) / 4,
            // workerContainer(workers[index][0], workers[index][1], workers[index][2], workers[index][3]);
            //   //);
            //             }
            //         ),
                  ),
                  SizedBox(height: 150,),
    ],
            )
        )
    );
  }
  int selectedCollection = 0;
  getCategories(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(categories.length, (index) =>
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CategoryBox(
                      selectedColor: Colors.white,
                      data: categories[index],
                      onTap: (){
                        setState(() {
                          selectedCollection =  index;
                        });
                      },
                    )
                )
            )
        ),
      );
  }
  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 45),
              SizedBox(height: 20,),
              Text(name, style: TextStyle(fontSize: 15),)
            ]
        ),
      ),
    );
  }

  workerContainer(String name, String job, String image, double rating) {
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
                    child: Image.asset(image)
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(job, style: TextStyle(fontSize: 15),)
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(rating.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
}