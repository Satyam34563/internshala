import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

drawerList(String st, IconData ic){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: ListTile(
      dense: true,
      leading: Icon(ic, size: 20),
      title: Text(st, style: const TextStyle(fontSize: 20),overflow: TextOverflow.fade,),
    ),
  );
}
drawerListMark(String st, IconData ic){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: ListTile(
      dense: true,
      leading: Icon(ic, size: 20),
      title: Row(
        children: [
          Text(st, style: const TextStyle(fontSize: 20),overflow: TextOverflow.fade,),
          const SizedBox(width: 10,),
          Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Colors.orange),
            width: 60, child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Center(child: Text("OFFER", style: TextStyle(color: Colors.white),)),
          ),)
        ],
      ),
    ),
  );
}
dropdownitem(String s, int value){
  return DropdownMenuItem(
      value: value,
      child: Text(s, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 18),));
}
outlineButton(String s){
          return Padding(
            padding: const EdgeInsets.only(left:4.0, right: 4.0),
            child: OutlinedButton(onPressed:() {
              
            }, 
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              padding: MaterialStatePropertyAll(EdgeInsets.only(left: 10, right: 10, top:0, bottom: 0))),
            child: Text(s, style: const TextStyle(color: Colors.black),)),
          );
}



outlineButtonwithicon(String s, VoidCallback? onPressed){
          return Padding(
            padding: const EdgeInsets.only(left:4.0, right: 4.0),
            child: OutlinedButton(onPressed:onPressed, 
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)))),
              padding: MaterialStatePropertyAll(EdgeInsets.only(left: 10, right: 10, top:0, bottom: 0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(s, style: const TextStyle(color: Colors.white),),
                const SizedBox(width: 10,),
                const Icon(Icons.cancel, color: Colors.white,)
              ],
            )),
          );
}
outlineButtonforNotch(String s, IconData ic, VoidCallback? onPressed){
          return Padding(
            padding: const EdgeInsets.only(left:4.0, right: 4.0),
            child: OutlinedButton(onPressed:onPressed, 
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              padding: MaterialStatePropertyAll(EdgeInsets.only(left: 10, right: 10, top:0, bottom: 0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(ic, size: 20,),
                const SizedBox(width: 10,),
                Text(s, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 6, 114, 202)),),
              ],
            )),
          );
}
outlinefilterButtonforNotch(String s, IconData ic, VoidCallback? onPressed, int filters){
          return Padding(
            padding: const EdgeInsets.only(left:4.0, right: 4.0),
            child: OutlinedButton(onPressed:onPressed, 
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              padding: MaterialStatePropertyAll(EdgeInsets.only(left: 10, right: 10, top:0, bottom: 0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                const SizedBox(width: 10,),
                Text(s, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 6, 114, 202)),),
                const SizedBox(width: 10,),
                CircleAvatar(
                  maxRadius: 12,
                  backgroundColor: Colors.blue,
                  child: Center(
                    child: Text(filters.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                )
              ],
            )),
          );
}
internCard(String company, location, duration, history, stipend, subtitle){
  return Padding(
    padding: const EdgeInsets.only(top:0.0, bottom: 8.0),
    child: Container(
      width: 100.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white,border: Border.all(width: 1, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1, color: Colors.black26)),
            child: const Padding(
              padding:  EdgeInsets.all(4.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Icon(Icons.verified_sharp, color: Colors.blue,),
                Text("Actively hiring", style: TextStyle(color: Colors.black87),)
              ],),
            ),
          ),
          const SizedBox(height: 15,),
          Text(company, style: const TextStyle(color: Colors.black, fontWeight:FontWeight.bold, fontSize: 22),),
          const SizedBox(height: 5,),
          Text(subtitle, style: const TextStyle(color: Colors.black87, fontSize: 16),),
          const SizedBox(height: 15,),
          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const Icon(Icons.location_on_outlined, ),
                const SizedBox(width: 4,),
                Text(location, style: const TextStyle(color: Colors.black87, fontSize: 18),)
              ],),
          const SizedBox(height: 15,),
          Row(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Icon(Icons.video_call_outlined, ),
                SizedBox(width: 4,),
                Text("Start Immediately", style: TextStyle(color: Colors.black87, fontSize: 18),)
              ],),
              const SizedBox(width: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const Icon(Icons.time_to_leave_outlined, ),
                const SizedBox(width: 4,),
                Text(duration, style:const TextStyle(color: Colors.black87, fontSize: 18),)
              ],),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const Icon(Icons.currency_rupee_outlined, ),
                const SizedBox(width: 4,),
                Text(stipend, style:const TextStyle(color: Colors.black87, fontSize: 18),)
              ],),
          const SizedBox(height: 15,),
          label("Internship"),
          const SizedBox(height: 15,),
          labelwithicon(history, Icons.history),
          const SizedBox(height: 15,),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed:() {
                
              }, child: const Text("View Details",style: TextStyle(fontSize: 18),)),
              ElevatedButton(onPressed:() {
                
              }, 
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.only(left:30, right: 30)),
                side: MaterialStatePropertyAll(BorderSide.none),
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: GestureDetector(
                onTap: () {
                  
                  launchUrlx("ww.google.com");
                },
                child: const Text("Apply Now", style: TextStyle(color: Colors.white, fontSize: 18),)))
            ],
          )
        ],
      ),
    ),
  );
}
label(String s){
  return Container(
    decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(3),),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(s, style: const TextStyle(color: Colors.black87, fontSize: 15),),
    ),
  );
}
labelwithicon(String s, IconData ic){
  return Container(
    decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(3),),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(ic, size: 18,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(s, style: const TextStyle(color: Colors.black87, fontSize: 15),),
        )
      ],
    ),
  );
}
elevatedButton(String s, VoidCallback? onPressed){
    return ElevatedButton(onPressed:onPressed, 
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.only(left:20, right: 20)),
                side: MaterialStatePropertyAll(BorderSide.none),
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: Text(s, style: const TextStyle(color: Colors.white, fontSize: 18),));
}
elevatedButtonPerfect(String s, VoidCallback? onPressed){
    return ElevatedButton(onPressed:onPressed, 
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.only(left:40, right: 40, top:10, bottom: 10)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)))),
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: Text(s, style: const TextStyle(color: Colors.white, fontSize: 22),));
}
outlineButtonperfect(String s, VoidCallback? onPressed){
          return Padding(
            padding: const EdgeInsets.only(left:4.0, right: 4.0),
            child: OutlinedButton(onPressed:onPressed, 
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)))),
              padding: MaterialStatePropertyAll(EdgeInsets.only(left: 40, right: 40, top:10, bottom: 10))),
            child: Text(s, style: const TextStyle(fontSize: 22,color: Color.fromARGB(255, 5, 86, 153)),)),
          );
}
textButton(String s, VoidCallback? onPressed){
  return TextButton(onPressed: onPressed, child: Text(s, style: const TextStyle(color: Colors.blue, fontSize: 20),));
}
searchBar(TextEditingController c, Function(String) onChanged){
  return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
                controller: c,
                onTap: () {
                  
                },
                onChanged: (value) {
                  onChanged(value);
                },
                hintText: "Search here...",
                hintStyle:  const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                elevation: const MaterialStatePropertyAll(0.0),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(6)),
                side: const MaterialStatePropertyAll(BorderSide(color: Colors.black26)),
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.search, size: 30),
                ),
              ),
          );
}

courseCard(String time, course, img){
  return Container(
    height: 300,
    width: 80.w,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: Colors.black38, width: 0.4)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 150,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset("assets/$img.webp", height: 150,)),
        ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(time, style: const TextStyle(color: Colors.black38),),
          const SizedBox(height: 10,),
          Text(course, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10,),
          const Text("⭐ 4.1  |  91,313"),
          const SizedBox(height: 10,),
          const Text("Know more >", style: TextStyle(color: Colors.blue, fontSize: 18),)],
        ),
      )
        
      ],
    ),
  );
}
labelDiffusedCoulour(){
  return Container(
    child: const Text("course with guaranteed job"),
  );
}

Future<void> launchUrlx(String url) async {
  var x=Uri.parse(url);
  if (!await launchUrl(x)) {
    throw Exception('Could not launch $x');
  }
}