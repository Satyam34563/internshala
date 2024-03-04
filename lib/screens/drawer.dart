import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerArea extends StatefulWidget {
  const DrawerArea({super.key});

  @override
  State<DrawerArea> createState() => _DrawerAreaState();
}

class _DrawerAreaState extends State<DrawerArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 76.w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Container(
                  width: 100.w,
                  alignment: Alignment.topRight,
                  child: const Icon(Icons.close, size: 33,color: Colors.black54,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 160,
                child: Image.asset("assets/internshala.jpeg")),
            ),
            const SizedBox(height: 30,),
            drawerList("Register", FontAwesomeIcons.user),
            drawerList("Login", FontAwesomeIcons.rightToBracket),
            const SizedBox(height: 15,),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left:8.0, top:14, bottom: 8),
              child: Text("EXPLORE", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            ),
            drawerList("Internships", FontAwesomeIcons.message),
            drawerList("Jobs", FontAwesomeIcons.addressCard),
            drawerListMark("Courses", FontAwesomeIcons.computer),
            drawerList("Placement Guarantee Courses", Icons.video_call_outlined),
            const Padding(
              padding: EdgeInsets.only(left:8.0, top:20, bottom: 8),
              child: Text("HELP & SUPPORT", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            ),
            drawerList("Help Center", Icons.help_center_outlined),
            drawerList("Report a Complaint", Icons.report_off_outlined),
            drawerList("More", Icons.more_horiz_outlined),
          ],
        ),
      ),
    );
  }
}