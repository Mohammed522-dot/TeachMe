import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:teachme/core/constant.dart';
import 'package:teachme/featuers/teach_me/data/datasourse/models/Service.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/TeacherSection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Service> services = [
    Service('Cleaning', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Plumber', 'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Electrician', 'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service('Painter', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Gardener', 'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home(),
    );
  }

  @override
  Widget home() {
    return SingleChildScrollView(
      child: Stack(
        children:[ Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height /3.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryColor.withOpacity(0.8),
              primaryColor
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
        ),
          Padding(
           padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(50),
                //   child: Image.asset('Teach-me-logo.png',
                //     width: 30 , height: 30,
                //   ),
                // ),
              ]),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hi,Mohammed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                SizedBox(height: 10),
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text('Your Education Our \n Prority',
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                     ),
                   ),
                   // Padding(
                   //   padding: const EdgeInsets.all(8.0),
                   //   child: Column(
                   //     children: [
                   //       Container(
                   //         margin: EdgeInsets.only(top: 15,bottom: 20),
                   //         width: MediaQuery.of(context).size.width,
                   //         height: 55,
                   //         alignment: Alignment.center,
                   //         decoration: BoxDecoration(
                   //           color: Colors.white,
                   //           borderRadius: BorderRadius.circular(10),
                   //           boxShadow:[
                   //             BoxShadow(
                   //               color: Colors.black45,
                   //               blurRadius: 6,
                   //               spreadRadius: 3,
                   //             ),
                   //           ],
                   //         ),
                   //         child: TextFormField(
                   //           decoration: InputDecoration(
                   //             border: InputBorder.none,
                   //             hintText: "Search here...",
                   //             hintStyle: TextStyle(
                   //               color: Colors.black.withOpacity(0.5),
                   //             ),
                   //             prefixIcon: Icon(
                   //               Icons.search,
                   //               size:25,
                   //             )
                   //           ),
                   //         ),
                   //       ),
                   //     ],
                   //   ),
                   // ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Topics",style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              shape: BoxShape.circle,
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                          ),
                          child: Center(
                            child: Icon(Icons.android_sharp),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("topic name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Top Teachers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TeacherSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
