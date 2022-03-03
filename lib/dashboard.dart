import 'package:farm/view.dart';
import 'package:flutter/material.dart';
import 'all.dart';
import 'utils/date_utils.dart' as date_util;
import 'config/size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:data_connection_checker/data_connection_checker.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void main() async {
    await Firebase.initializeApp();
  }

  final fb = FirebaseDatabase.instance;
  double width = 0.0;
  double height = 0.0;
  int nextdate;
  bool visnone= false;
  bool visactive=true;
  String dociiid;
  double nodataheight;
  double dataheight;
  int count = 1;
  ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
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
    double nodataheight=100;
    double dataheight=100;




    return Scaffold(

      body: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/cocoa.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height / 22,
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: Text(
                        date_util.DateUtils.months[currentDateTime.month - 1] +
                            ' ' + currentDateTime.day.toString() + "," + ' ' +
                            currentDateTime.year.toString(),
                        style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                Container(
                  height: height / nodataheight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),

                  ),


                  padding: EdgeInsets.symmetric(
                      horizontal: width / 25, vertical: height / 90),
                  child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                            milliseconds: 800),
                        height: height,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        autoPlay: true,

                      ),
                      items: List.generate(
                        3,
                            (index) {
                          return Container(

                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),

                              ),
                              child:Text("no data",style: TextStyle(color: Colors.white),)
                          );



                        },
                      )
                  ),
                ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),


                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection(currentDateTime.year.toString()).where("current_date",isEqualTo:date_util.DateUtils.months[currentDateTime.month - 1] +
                          ' ' + currentDateTime.day.toString() + "," + ' ' +
                          currentDateTime.year.toString() ).snapshots(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (snapshot.hasData&& !snapshot.data.docs.isEmpty){
                          print(snapshot.data.docs.toString());
                          return new Container(
                            height: height/1.8,
                                child:  CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration: const Duration(
                                          milliseconds: 800),
                                      height: height,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: false,
                                      autoPlay: true,

                                    ),
                                    items: List.generate(
                                        snapshot.data.docs.length,
                                            (index) {
                                          DocumentSnapshot doc = snapshot.data.docs[index];
                                          return Container(

                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.8),

                                              ),
                                              child:Padding(padding: EdgeInsets.only(left: 5,right:5,top:height/50,bottom:5),
                                                  child:Column(
                                                    children: <Widget>[
                                                      Container(
                                                        height: height/6,
                                                        child:   Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                             Text("Farm ID:",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                                                            Text("${doc["cell_farm_id"]}",style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text("Location: ",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                                                                Text("${doc["cell_farm_loc"]}",style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w700)),

                                                              ],
                                                            ),
                                                            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                              Container(
                                                                height:height/17,
                                                              child:   ElevatedButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      var z="${doc["cell_farm_id"]}";
                                                                      var c="${doc["current_date"]}";
                                                                      Navigator.of(context).push(
                                                                        PageRouteBuilder(
                                                                          pageBuilder: (context, animation1, animation2) => view(z,c),
                                                                          transitionDuration: Duration(seconds: 0),
                                                                        ),);

                                                                    });
                                                                  }, child: Text('View Location',style: TextStyle( fontSize:16))),
                                                            ),

                                                              ],
                                                            )
                                                                 ],
                                                        ),
                                                      ),

                                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [

                                                          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("Farmer Name:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_farmer_name"]}".length > 16? doc["cell_farmer_name"].substring(0, 10)+'...' :doc["cell_farmer_name"],style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Farmer ID:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_id_number"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Estimated Trees:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_est_trees"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("OB Size:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_ob_size"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Farms in OB:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_farm_in_ob"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),


                                                            ],
                                                          ),
                                                          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                               Text("GPS Location:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_y"]},${doc["cell_x"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Trees Remo:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["cell_trees_remo"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Previous Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["last updated"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),
                                                              Text("Present Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["current_date"]}",style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.w700)),
                                                              Text("Next Visit Date:",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                                              Text("${doc["next_date"]}",style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w700)),

                                                            ],
                                                          ),

                                                        ],
                                                      ),
                                                      Expanded(

                                                          flex: 3,
                                                          child: Image.asset("assets/cocobod.png")
                                                      ),

                                                    ],
                                                  )


                                              )
                                          );

                                        } )),
                          );
                        }
                        else
                          {
                            print("hhhh");

                            return Container(
                              height: height / 1.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),

                              ),


                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 25, vertical: height / 90),
                              child: CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration: const Duration(
                                        milliseconds: 800),
                                    height: height,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: false,
                                    autoPlay: true,

                                  ),
                                  items: List.generate(
                                    3,
                                        (index) {


                                      /* var one = int.parse('${doc["cell_index"]}');
                      setState(() {
                        nextdate = one;
                      });*/
                                      return Container(

                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.8),

                                          ),
                                          child:Padding(padding: EdgeInsets.only(left: 5,right:5,top:height/50,bottom:5),
                                              child:Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: height/6,
                                                    child:   Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("No Farm Visits",style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w900)),
                                                        Text("Today",style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w900)),


                                                      ],
                                                    ),
                                                  ),

                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Expanded(
                                                        child: Container(
                                                            child:
                                                            SingleChildScrollView(
                                                              child:
                                                              Text("Check the date for the next farm visit in the monthly list below",overflow: TextOverflow.clip, style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w600)),
                                                            )) ,
                                                      ) ,

                                                    ],
                                                  ),
                                                  Expanded(

                                                      flex: 3,
                                                      child: Image.asset("assets/cocobod.png")
                                                  ),

                                                ],
                                              )


                                          )
                                      );



                                    },
                                  )
                              ),
                            );

                        }
                      },
                    )
                  ),






                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: height / 14,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: width / 20),
                                child: Text(
                                  "Farms to visit in ${date_util.DateUtils.months[currentDateTime.month - 1]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: fontSize(20), color: Colors.white),
                                )),
                            ElevatedButton(onPressed: movetomain, child: Text('All Farms',style: TextStyle( fontSize:16))),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(

                              flex: 5,
                              child: Center(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection(currentDateTime.year.toString()).where("cell_month",isEqualTo:"${date_util.DateUtils.months[currentDateTime.month - 1]}").snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return new Padding(padding: EdgeInsets.only(right:5,left: 5, bottom: 5,top: 5),
                                        child: SizedBox(
                                          height: height/1.1,
                                          child:  new ListView.builder(

                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshot.data.docs.length,
                                            itemBuilder: (context, index) {
                                              DocumentSnapshot doc = snapshot.data.docs[index];

                                              return new  GestureDetector(
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

                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: height/90),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(right: 10),
                                                      width: width/35,
                                                      height: height/50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          shape: BoxShape.circle),
                                                    ),
                                                    Text("${doc['cell_farm_id']} \nDate: ${doc['current_date']}".toUpperCase()
                                                      ,
                                                      style: TextStyle(
                                                          fontSize: fontSize(15), color: Colors.white
                                                      ),
                                                    ),
                                                    Text(" >>"
                                                      ,
                                                      style: TextStyle(
                                                          fontSize: fontSize(28), color: Colors.blue,fontWeight: FontWeight.w900
                                                      ),
                                                    ),



                                                  ],
                                                ),),
                                              ); },


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
                            ),
                            Expanded(

                                flex: 3,
                                child: Image.asset("assets/farmer.png")
                            ),

                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
      ),
    );
  }

  void movetomain() {
    setState(() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => all("${currentDateTime.year.toString()}")));
    });

  }
  Future<void> docid() async {

    var collection = FirebaseFirestore.instance.collection('2022');
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      print(documentID);
      setState(() {
        dociiid = documentID;
      });

      }
     /* FirebaseFirestore.instance.collection("2022").doc(documentID).set({
        "cell_index" : "1",
      });*/
      // <-- Document ID



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