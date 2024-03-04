import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/drawer.dart';
import 'package:flutter_application_1/screens/intern.dart';
import 'package:flutter_application_1/widgets.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedValue=0;
  List<String>title=["Home", "Internships", "Courses"];
  @override
  Widget build(BuildContext context) {
    List<Widget>widgetList=[myHome(context),const InternshipPage()];
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerArea(),
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(title[selectedValue], style:const TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
      ),
      body: widgetList[selectedValue],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        currentIndex: selectedValue,
        onTap: (value) {
          setState(() {
            selectedValue=value;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.sms_sharp), label: "Internships"),
      ],),
    );
  }
}

myHome(BuildContext context){
  List<String>img=["dash1.webp", "dash2.png", "dash3.webp"];
  List<Widget>wid=[courseCard("8 weeks", "Python", "c11"), courseCard("8 weeks", "Java", "c22"), courseCard("8 weeks", "Web Development", "c33")];
  return SingleChildScrollView(
    child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:28.0, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hi, Satyam!👋", style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),),
                  const Text("Let's help you land your dream carrer", style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 30,),
                  const Text("Trending on Internshala 🔥", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                  const SizedBox(height: 20,),
                  CarouselSlider(
                    items: img.map((e) {
                      return Image.asset("assets/$e");
                    }).toList(), 
                    options: CarouselOptions(
                      initialPage: 1,
                      enableInfiniteScroll:true,
                      reverse: true,
                    height: 240.0,
                    viewportFraction: 1,
                    enlargeCenterPage: true
                    )),
                    const SizedBox(height: 20,),
                    const Text("Popular certification courses", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                    const SizedBox(height: 20,),

                    CarouselSlider(
                    items: wid, 
                    options: CarouselOptions(
                      initialPage: 1,
                      reverse: true,
                    height: 335.0,
                    viewportFraction: 0.8,
                    enableInfiniteScroll:false,
                    enlargeCenterPage: true
                    )),
                    
                ],
              )
            )
          ],
        ),
  );
}