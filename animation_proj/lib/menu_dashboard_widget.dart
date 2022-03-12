import 'package:flutter/material.dart';
final TextStyle menufontStyle =TextStyle(color: Colors.white,fontSize: 20);
final Color backgroundColor =Color(0xFF343442);
class MenuDashboard extends StatefulWidget {
  const MenuDashboard({Key key}) : super(key: key);

  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

  class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin {
   double ekranYuksekliyi,ekranGenisliyi;
bool menuAcikmi =false;
AnimationController _controller;
Animation<double> _scaleAnimation;
final Duration _duration =Duration(milliseconds: 500);
Animation<Offset> _menuOffsetAnimation;
Animation<Offset> _scalemenuAnimation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =AnimationController(vsync: this,duration: _duration);
    _scaleAnimation=Tween(begin: 1.0,end: 0.6).animate(_controller);

    _menuOffsetAnimation =Tween(begin: Offset(-1,0),end: Offset(0,0)).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ekranYuksekliyi =MediaQuery.of(context).size.height;
    ekranGenisliyi =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuYarad(context),
            dashboardYarad(context),
          ],
        ),
      ),
    );
  }

  Widget menuYarad(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Align(

          alignment: Alignment.centerLeft,

          child: Column(


            mainAxisSize: MainAxisSize.min,


            mainAxisAlignment: MainAxisAlignment.spaceAround,


            crossAxisAlignment: CrossAxisAlignment.start,


            children: <Widget>[


              Text("Dasboard", style: menufontStyle,),


              SizedBox(height: 10,),


              Text("Messages", style: menufontStyle,),


              SizedBox(height: 10,),


              Text("Utility Bilds", style: menufontStyle,),


              SizedBox(height: 10,),


              Text("Fund Transfer", style: menufontStyle,),


              SizedBox(height: 10,),


              Text("Break", style: menufontStyle,),


              SizedBox(height: 10,),


            ],),

        ),
      ),
    );
  }

  Widget dashboardYarad(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top:0,
      bottom: 0,
      left: menuAcikmi ? 0.4*ekranGenisliyi: 0,
      right:  menuAcikmi ? -0.4* ekranGenisliyi :0,
      child: ScaleTransition(
        scale:_scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: Container(
               padding: EdgeInsets.only(left: 16,right: 16,top: 8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(menuAcikmi){
                            _controller.reverse();
                          }else{
                            _controller.forward();
                          }
                          menuAcikmi =!menuAcikmi;
                        });
                      },
                        child: Icon(Icons.menu, color: Colors.white,size:35,)),
                    Text("My Cards", style: TextStyle(color: Colors.white),),
                    Icon(Icons.add_circle_outline)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(color: Colors.teal,width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12),),
                      Container(color: Colors.deepOrange,width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),),
                      Container(color: Colors.brown,width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),),
                      Container(color: Colors.blue,width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
