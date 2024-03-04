import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dataRequired.dart';
import 'package:flutter_application_1/screens/profileWidget.dart';
import 'package:flutter_application_1/widgets.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = 'SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<DropdownMenuItem>itemss=[];
  List<DropdownMenuItem>internDuration=[];
  List<String>city=["Delhi/NCR","Banglore", "Mumbai", "Hyderabad", "Chennai", "Kolkata"];
  List<String>categories=["Big brands","Work from home", "Part-time", "MBA", "Engineering", "Media", "Design", "Data Science"];
  int selectedVal=1;
  int selectedValIntern=0;
  List<int>durationOfIntern=[1, 2, 3, 4, 6, 12, 24, 36];
  //data to be needed
  List<String>profile=[];
  int duration=0;
  List<String>cityOfIntern=[];


  //apply
  _runApplyFunction(){
    Navigator.of(context).pop([profile,cityOfIntern, selectedValIntern]);
  }

  callBack(result, type){
    if(type=="Profile"){
      profile=result;
    }else{
      cityOfIntern=result;
    }
    setState(() {
      profile;
      cityOfIntern;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    runFunc();
  }
    List<Padding>cityBtn=[];
    List<Padding>catBtn=[];
  runFunc(){
    internDuration.add(dropdownitem("No preference", 0) );
    for(int i in durationOfIntern){
      internDuration.add(dropdownitem(i.toString(), i) );
    }
    itemss.add(dropdownitem("Internships", 1) );
    for(int i=0; i<city.length; i++){
      cityBtn.add(outlineButton(city[i]));
    }
    for(int i=0; i<categories.length; i++){
      catBtn.add(outlineButton(categories[i]));
    }
  }
  _clearAll(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SearchScreen())
          ).then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text("Filters", style:TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(left:18.0, top:20, bottom: 8),
                child: Text("Looking for", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only( bottom:35),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                isExpanded: true,
                items: itemss,
                value: selectedVal,
                onChanged: (value) {
                  setState(() {
                    selectedVal=value;
                  });
                },
              )
            ),
        
            ProfileWidget(dataReq: computerRelatedSkills, result: profile,name: "Profile",callbackfunction: callBack,),
            ProfileWidget(dataReq: citiesInIndia, result: cityOfIntern,name: "City",callbackfunction: callBack,),
            //input
        

              const Padding(
                padding: EdgeInsets.only(left:18.0, top:20, bottom: 8),
                child: Text("MAXIMUM DURATION (IN MONTHS)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only( bottom:35),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                isExpanded: true,
                items: internDuration,
                value: selectedValIntern,
                onChanged: (value) {
                  setState(() {
                    selectedValIntern=value;
                  });
                },
                )
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:10.0, right:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    outlineButtonperfect("Clear all", (){
                      _clearAll();
                    }),
                    elevatedButtonPerfect("Apply", (){
                      _runApplyFunction();
                    })
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}