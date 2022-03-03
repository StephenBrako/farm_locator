import 'package:farm/update.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'config/size.dart';
import 'months.dart';
import 'utils/date_utils.dart' as date_util;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class all extends StatefulWidget {
  final String date;
  all(this.date);
  State<StatefulWidget> createState() {

    return _allState(this.date);
  }
}

class _allState extends State<all> {
  double width = 0.0;
  double height = 0.0;
  Timer debouncer;
  String date;
  _allState(this.date);
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];

  void initState() {
    DateTime date = DateTime.now();
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    super.initState();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 100),
      }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }
  ScrollController _controller2;
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
      DateTime currentDateTime = DateTime.now();}

    currentDateTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'All ${widget.date} Farms',
          style: TextStyle(color: Colors.amber),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.post_add_sharp, color: Colors.black,size: height/23,),
            onPressed: () =>  Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => update(),
                transitionDuration: Duration(seconds: 0),
              ),)
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,


        centerTitle: true,
      ),
      body:  Container(
        color:Colors.blueGrey.withOpacity(0.3) ,

        child:ListView(
          children: [
            GestureDetector(
              onTap: () {
                movetomain("January");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              SizedBox(
                                height: 10,
                              ),

                              Text("January", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)

                              ,SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("February");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              SizedBox(
                                height: 10,
                              ),

                              Text("February", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)
                              ,SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("March");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),



                              Text("March", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)

                             , SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("April");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              SizedBox(
                                height: 10,
                              ),

                              Text("April", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)
                              ,SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("May");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              SizedBox(
                                height: 10,
                              ),

                              Text("May", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)
                              ,SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("June");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SizedBox(
                                height: 10,
                              ),


                              Text("June", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)
                              ,SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("July");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SizedBox(
                                height: 10,
                              ),


                              Text("July", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),)
                              ,SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("August");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),



                              Text("August", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: 10,
                              ),


                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("September");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [



                              SizedBox(
                                height: 10,
                              ),
                              Text("September", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: 10,
                              ),


                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("October");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),




                              Text("October", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),),

                              SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),
            GestureDetector(
              onTap: () {
                movetomain("November");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),



                              Text("November", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: 10,
                              ),


                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),

            GestureDetector(
              onTap: () {
                movetomain("December");
              },


              child:
              Card(

                  child:Padding(padding: EdgeInsets.all(5),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SizedBox(
                                height: 10,
                              ),


                              Text("December", style: TextStyle(fontSize: 20,color: Colors.blueGrey.withOpacity(0.95) ,fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: 10,
                              ),


                            ],
                          ),
                          Container(

                              height: height/35,
                              child: Image.asset("assets/cocoaleaves.png")
                          ),

                        ],
                      )

                  )
              ),),




          ],
        )
      ),

    );
  }
  void movetomain(x) {
    setState(() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => months("$x")));
    });

  }
}

