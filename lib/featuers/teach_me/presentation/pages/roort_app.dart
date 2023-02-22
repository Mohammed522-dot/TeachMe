import 'package:flutter/material.dart';
import 'package:teachme/core/classes/language_constants.dart';
import 'package:teachme/core/error/color.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/account.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home_page.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/search.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp>  with TickerProviderStateMixin{
  int activeTab = 0;
  List barItems = [
    {
      "icon" : "assets/icons/home.svg",
      "title" : "Home",
      "active_icon" : "assets/icons/home.svg",
      "page" : const HomeScreen(),
    },
    {
      "icon" : "assets/icons/search.svg",
      "title" : "Search",
      "active_icon" : "assets/icons/search.svg",
      "page" : const SearchPage(),
    },
    {
      "icon" : "assets/icons/play.svg",
      "title" : "Appointment",
      "active_icon" : "assets/icons/play.svg",
      "page" : Container(),
    },

    {
      "icon" : "assets/icons/profile.svg",
      "title" : "Account",
      "active_icon" : "assets/icons/profile.svg",
      "page" : const AccountPage(),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration:  const Duration(milliseconds: 3000),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page){
    return FadeTransition(
        child: page,
        opacity: _animation
    );
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        body: getBarPage()
    );
  }

  Widget getBarPage(){
    return
      IndexedStack(
          index: activeTab,
          children:
          List.generate(barItems.length,
                  (index) => animatedPage(barItems[index]["page"])
          )
      );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1)
            )
          ]
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15,),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(barItems.length,
                      (index) =>  Column(
                        children: [
                          BottomBarItem(barItems[index]["icon"],barItems[index]["title"], isActive: activeTab == index, activeColor: primary,
                    onTap: (){
                          onPageChanged(index);
                    },
                  ),
                        ],
                      )
              )
          )
      ),
    );
  }

}