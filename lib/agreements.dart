import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/size.dart';

import 'dashboard.dart';
class agreement extends StatefulWidget {
  @override
  _agreementState createState() => _agreementState();
}

class _agreementState extends State<agreement> {

  bool agree = false;

  // This function is triggered when the button is clicked
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms and Conditions",//voters id, passport, license,snnit
          style: TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff00444f),
          ),
        ),


      ),

      body:  Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(


              padding: EdgeInsets.only(left: 15,right: 15),
              child:Text("Please read these terms and conditions carefully before using this application", style: TextStyle(fontWeight: FontWeight.w700),),),



            SizedBox(
              height: 10,
            ),
      Container(

          padding: EdgeInsets.only(left: 15,right: 15),
          child:Text("Conditions of Use", style: TextStyle(fontWeight: FontWeight.w700),),),

            SizedBox(
              height: 5,
            ),Expanded(
          child: Container(
              height: height/20,
              padding: EdgeInsets.only(left: 15,right: 15),

              child:
              SingleChildScrollView(
                child: Text( 'By using this website, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement,you are advised to quit this mobile application accordingly. © Baslab2008 Enterprice only grants use and access of this cocobod farms mobile application and its services to those who have accepted its terms.'

                  ,    overflow: TextOverflow.clip, textAlign: TextAlign.justify,
                ),
              )) ,
        ) ,
            SizedBox(
              height: 5,
            ),
      Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child:Text("User Restrictions", style: TextStyle(fontWeight: FontWeight.w700),),),
            SizedBox(
              height: 5,
            ),Expanded(
          child: Container(
              padding: EdgeInsets.only(left: 15,right: 15),

              child:
              SingleChildScrollView(
                child: Text(  'You must be a worker of Ghana Cocoa Board before you can use this mobile application. By using this application, you warrant that you are a worker of Ghana Cocoa Board and you may legally adhere to thisAgreement.© Baslab2008 Enterprise assumes no responsibility for liabilities related to worker misrepresentation.'

                  ,    overflow: TextOverflow.clip, textAlign: TextAlign.justify,
                ),
              )) ,
        ) ,
            SizedBox(
              height: 5,
            ),
      Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child:Text("Intellectual Property", style: TextStyle(fontWeight: FontWeight.w700),),),

            SizedBox(
              height: 5,
            ), Expanded(
          child: Container(
              padding: EdgeInsets.only(left: 15,right: 15),

              child:
              SingleChildScrollView(
                child: Text('You agree that all materials, products, and services provided on this mobile application are the property of © Baslab2008 Enterprise, its affiliates, directors, officers, employees, agents, suppliers, or licensors including all copyrights, trade secrets, trademarks, patents, and other intellectual property. You also agree that you will not reproduce or redistribute the Cocobod Farms application’s intellectual property in any way,including electronic, digital, or new trademark registrations'

                  ,    overflow: TextOverflow.clip, textAlign: TextAlign.justify,
                ),
              )) ,
        ) ,
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value;
                  });
                },
              ),
            ),
            Text(
              'I have read and accept terms and conditions',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        Center(
          child: ElevatedButton(onPressed: agree ? movetomanual : null, child: Text('Continue')),
        ),
        SizedBox(
          height: height/50,
        )
      ]),
    );
  }
  void movetomanual() {
    setState(() {
      _signupdone();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => DashboardPage()),(route) => false);

      });});}

  void _signupdone() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = 50;
    prefs.setInt(key, value);
    print('saved $value');
  }

}
