import 'package:farm/update.dart';
import 'package:farm/view.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'config/size.dart';
import 'utils/date_utils.dart' as date_util;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class months extends StatefulWidget {
  final String date;
  months(this.date);
  State<StatefulWidget> createState() {

    return _monthsState(this.date);
  }
}

class _monthsState extends State<months> {
  double width = 0.0;
  double height = 0.0;
  Timer debouncer;
  String date;
  _monthsState(this.date);
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
          '${widget.date} ${currentDateTime.year.toString()} Farms',
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

        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(currentDateTime.year.toString()).where("cell_month",isEqualTo:"${widget.date}").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Padding(padding: EdgeInsets.only(right:5,left: 5, bottom: 5,top: 5),
                child: SizedBox(
                  height: height/1.1,
                  child:  new ListView.builder(
                    controller: _controller2,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.docs[index];



                      return new GestureDetector(
                          onTap: () {
                        setState(() {
                          var z="${doc["cell_farm_id"]}";
                          var c="${doc["current_date"]}";
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => view(z,c),
                              transitionDuration: Duration(seconds: 0),
                            ),);

                        });
                      },

                      child:Card(

                          child:Padding(padding: EdgeInsets.all(5),
                            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Location: ${doc["cell_farm_loc"]}",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                    Text("Farm ID: ${doc["cell_farm_id"]}",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                    Text("Visit Date: ${doc["current_date"]}",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                    Text("GPS: ${doc["cell_x"]},${doc["cell_y"]} ",style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w700)),



                                  ],
                                ),
                                Container(

                                    height: height/20,
                                    child: Image.asset("assets/cocoa.png")
                                ),

                              ],
                            )

                           ),),
                      );
                    },


                  ),
                ),
              );
            } else {
              return Center(
                child: Text("No data"),
              );
            }
          },
        ),
      ),

    );
  }
  viewgps(x,y){

  }
}

