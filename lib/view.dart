import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';
import 'config/size.dart';
import 'utils/date_utils.dart' as date_util;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';



class view extends StatefulWidget {
  final String date;
  final String late;
  view(this.date, this.late);
  State<StatefulWidget> createState() {

    return _viewState(this.date,this.late);
  }
}

class _viewState extends State<view> {
  double width = 0.0;
  double height = 0.0;
  Timer debouncer;
  String date;
  String late;
  _viewState(this.date,this.late);
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
          '${widget.date} Farm',
          style: TextStyle(color: Colors.amber,fontSize: 17),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,


        centerTitle: true,
      ),
      body:  Container(
        color:Colors.blueGrey.withOpacity(0.3) ,

        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(currentDateTime.year.toString()).where("current_date",isEqualTo: widget.late).where("cell_farm_id",isEqualTo:widget.date).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              datacheck();
              return new Padding(padding: EdgeInsets.only(right:5,left: 5, bottom: 5,top: 5),
                child: SizedBox(
                  height: height/1.1,
                  child:  new ListView.builder(
                    controller: _controller2,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.docs[index];
                      return new Column(
                        children: [
                          Card(

                              child:Padding(padding: EdgeInsets.all(2),
                                  child:Container(
                                    height: height/1.7,
                                    child: WebView(
                                      initialUrl: 'https://www.google.com/maps/search/${doc["cell_y"]},${doc["cell_x"]}',
                                      javascriptMode: JavascriptMode.unrestricted,
                                    ),
                                  )

                              )
                          ),
                          Card(


                          child:Padding(padding: EdgeInsets.all(5),
                              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Location:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_farm_loc"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Farm ID:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_farm_id"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Farmer Name:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_farmer_name"]}".length > 16? doc["cell_farmer_name"].substring(0, 10)+'...' :doc["cell_farmer_name"],style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Farmer ID:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_id_number"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Estimated Trees:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_est_trees"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Farms in OB:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_farm_in_ob"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),

                                    ],
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("OB Size:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_ob_size"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("GPS Location:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_y"]},${doc["cell_x"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Previous Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["last updated"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Present Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["current_date"]}",style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.w700)),
                                      Text("Next Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["next_date"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                      Text("Trees Remo:",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                                      Text("${doc["cell_trees_remo"]}",style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w700)),


                                    ],
                                  ),

                                ],
                              )


                      )
                          ),



                        ],
                      );
                    },


                  ),
                ),
              );
            } else {
              datacheck();
              return Center(
                child: Text("No data"),
              );
            }
          },
        ),
      ),

    );
  }

  void _showAlertDialog(String title, String message) {

    var alertStyle = AlertStyle(
      overlayColor: Colors.black87,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
      animationDuration: Duration(milliseconds: 200),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.blue,
        ),
      ),
      titleStyle: TextStyle( fontSize: 22,fontWeight: FontWeight.w700,
          color: Colors.red
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.warning,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          child: Text(
            "Retry",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.blue,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }

  void datacheck()async{

    bool results = await DataConnectionChecker().hasConnection;
    if(results == true) {
      print("ff");
    }else {
      _showAlertDialog('no internet connection', "check your WiFi or mobbile network data connection");


    }



  }
}

