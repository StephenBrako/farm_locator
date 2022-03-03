import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'all.dart';
import 'config/size.dart';
import 'dashboard.dart';
import 'utils/date_utils.dart' as date_util;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class update extends StatefulWidget {
  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {
  double width = 0.0;
  double height = 0.0;
  int _state1 = 0;
  TextEditingController farmerid = TextEditingController();
  TextEditingController farmid = TextEditingController();
  TextEditingController currentdate = TextEditingController();
  TextEditingController lastdate = TextEditingController();
  TextEditingController nextdate = TextEditingController();
  TextEditingController cellx = TextEditingController();
  TextEditingController celly = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController farmername = TextEditingController();
  TextEditingController obsize = TextEditingController();
  TextEditingController estimatedtrees = TextEditingController();
  TextEditingController farminob = TextEditingController();
  TextEditingController treesremo = TextEditingController();

  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  ScrollController scrollController;

  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();


  }



  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
      DateTime currentDateTime = DateTime.now();}
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add New Farm',
          style: TextStyle(color: Colors.amber),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,


        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Column(



                children:[
                  Container(
                    height: height/2,
                    color: Colors.blueGrey,
                    padding: EdgeInsets.only(top: 15.0,),


                    child: ListView(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[

                                Column(children: <Widget>[
                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: farmerid,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Farmer ID",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: farmid,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Farm ID",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: currentdate,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Date for Visit",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: lastdate,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Previous Visit Date ",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: nextdate,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input 2nd Date to Visit",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: cellx,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input X coordinates (long)",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: celly,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Y Coordinates (Lat)",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: location,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Farm Location",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: farmername,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Farmer Name",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: obsize,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input OB Size",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: estimatedtrees,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input Estimated Trees",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: farminob,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input no. Farms in OB",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),

                                  Padding(padding: EdgeInsets.only(top: 5.0, right:10, bottom: 5.0),
                                    child:Container(
                                      height: height/20,
                                      width: width/1.1,
                                      child: TextField(
                                        controller: treesremo,
                                        style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',

                                        ),

                                        onChanged: (value) {
                                          debugPrint('Something changed in Description Text Field');


                                        },
                                        decoration: InputDecoration(
                                            hintText: "input no. Trees Remo",
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),

                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            )
                                        ),
                                      ),

                                    ),),
                                  SizedBox(height: height/90,),





                                ]

                                ),



                              ],
                            )

                        ),
                        SizedBox(height: height/40,),
                        //nhis




                      ],
                    ),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: height/20,
                        width: width/1.5,


                        child: RaisedButton(
                          elevation: 5.0,

                          onPressed: () {

                            animateButton7();
                            save();


                          },


                          padding: EdgeInsets.all(3.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Color(0XFF203354),
                          child: setUpButtonChild4(),
                        ),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                            padding: EdgeInsets.only(left: 15,right: 15),
                            child:
                            SingleChildScrollView(
                              child: Text('Please type all dates strictly in this format \n example: "January 1, 2022"',style: TextStyle(color: Colors.red, fontSize: 17,fontWeight: FontWeight.w800)
                                ,   overflow: TextOverflow.clip, textAlign: TextAlign.justify,
                              ),
                            )) ,
                      ) ,
                      SizedBox(
                        height: 20,
                      ),
                      Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(

                              flex: 3,
                              child: Image.asset("assets/cocobod.png")
                          ),
                          Container(
                            child: Text("© Baslab2008 Enterprise", style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      )

                    ],

                  )
                ]






              ),








            ],
          ),
        ),


      ),
    );
  }


  Future<void> save() async {
    DateTime date = DateTime.now();
    if (estimatedtrees.text!="" && farmid.text!=""&& farminob.text!=""&& location.text!=""&& farmername.text!=""
        && farmerid.text!=""&& obsize.text!=""&& treesremo.text!=""&& cellx.text!=""&& celly.text!=""&& currentdate.text!=""&& nextdate.text!=""&& lastdate.text!=""){
    FirebaseFirestore.instance.collection("${currentDateTime.year.toString()}").doc("${date.year}-${date.month}-${date.day}_${date.hour}:${date.minute}.${date.second}").set({
      "cell_age_class" : "n/a",
      "cell_coc_type" : "n/a",
      "cell_est_trees" : estimatedtrees.text,
      "cell_farm_id" : farmid.text,
      "cell_farm_in_ob" : farminob.text,
      "cell_farm_loc" : location.text,
      "cell_farmer_name" : farmername.text,
      "cell_id_number" : farmerid.text,
      "cell_index" : "n/a",
      "cell_month" : "n/a",
      "cell_ob_size" : obsize.text,
      "cell_trees_remo" : treesremo.text,
      "cell_x" : cellx.text,
      "cell_y" : celly.text,
      "current_date" : currentdate.text,
      "last flag updated" : "false",
      "last updated" : lastdate.text,
      "next_date" : nextdate.text
    });
    animateButton8();}
    else{
      animateButton8();
      _showAlertDialog('Empty Slot', "Kindly fill in every detail, type 'n/a' if not applicable");
    }


  }


  void movetomain() {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => all("${currentDateTime.year.toString()}")),(route) => false);

      });});}

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
      save();
      animateButton8();
    }else {
      _showAlertDialog('no internet connection', "check your WiFi or mobbile network data connection");
      animateButton8();

    }



  }

  Widget setUpButtonChild4() {
    if (_state1 == 0) {
      return new Text(
        'SAVE FARM DETAILS',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      );
    } else if (_state1 == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton8() {
    setState(() {
      _state1 = 0;
    });
  }
  void animateButton7() {
    setState(() {
      _state1 = 1;
    });
  }

}
