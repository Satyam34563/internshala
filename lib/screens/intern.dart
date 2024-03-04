import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/networkHandler.dart';
import 'package:flutter_application_1/screens/search_screen.dart';
import 'package:flutter_application_1/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  NetworkHandler network = NetworkHandler();
  int totalInterns=0;
  List<Widget>widList=[];
  bool is_loading=true;
  var data;
  bool is_filtered=false;
  var filters;
  updateFilter(dataFiltered){
    setState(() {
      filters=dataFiltered;
    });
  }
  displayData(ids){
      widList=[];
      for(int i=0; i<ids.length; i++){
      var loc=data["internships_meta"][ids[i].toString()];
      if(loc!=null){
        String locations="";
        int len=loc["location_names"].length;
        for(int j=0; j<len; j++){
          if(j!=len-1){
            locations += loc["location_names"][j]+", ";
          }else{
            locations += loc["location_names"][j];
          }
        }
        widList.add(internCard(loc["title"], locations==""?"Location not available":locations, loc["duration"] ,loc["posted_by_label"], loc["stipend"]["salary"], loc["company_name"]));
      }
    }

    setState(() {
      is_loading=false;
      totalInterns=ids.length;
      data;
    });


  }
  getData()async{
    setState(() {
      is_loading=true;
    });
    data = await network.get();
    List<dynamic>ids=data["internship_ids"];
    displayData(ids);
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return is_loading?const Center(child: CircularProgressIndicator()): 
    Scaffold(
      backgroundColor: const Color.fromARGB(31, 102, 100, 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            !is_filtered? topNotch(totalInterns.toString(), context, filterData):
            topNotchforfilter(totalInterns.toString(), context, filterData, filters),
            Column(
              children: widList,
            ),
          ],
        ),
      ),
    );
  }
  filterData(dataFiltered){
    List ids2=data["internship_ids"];
    List<dynamic> idstobeshown=[];
    bool fil=false;
    if(dataFiltered[1].length!=0){
      fil=true;
    }
    if(dataFiltered[2]!=0){
      
    
        for(var i in ids2){
              var locx=data["internships_meta"][i.toString()];
              String duration = locx["duration"].split(" ")[0];
              int d=int.parse(duration);
              if(fil){
                    List locationsx=locx["location_names"];
                    bool locSuc=false;
                        for(String l in locationsx){
                          for(String l2 in dataFiltered[1]){
                            if(l.toLowerCase().contains(l2.toLowerCase())){
                              locSuc=true;
                            }
                          }
                        }
                    if(d==dataFiltered[2] && locSuc){
                      idstobeshown.add(i);
                    }
              }else{
                  if(d==dataFiltered[2]){
                    idstobeshown.add(i);
                  }
              }
          
        }

  }else{
            for(var i in ids2){
              var locx=data["internships_meta"][i.toString()];
              if(fil){
                    List locationsx=locx["location_names"];
                    bool locSuc=false;
                        for(String l in locationsx){
                          for(String l2 in dataFiltered[1]){
                            if(l.toLowerCase().contains(l2.toLowerCase())){
                              locSuc=true;
                            }
                          }
                        }
                    if(locSuc){
                      idstobeshown.add(i);
                    }
              }else{
                 
                    idstobeshown.add(i);
                  
              }
          
        }
  }
    setState(() {
        is_filtered=true;
    });
    displayData(idstobeshown);
    updateFilter(dataFiltered);
  }


}
topNotch(String totalInterns, context, Function filterData){
  var dataFiltered;
  return Container(
    width: 100.w,
    color: Colors.white,
    child: Column(
      children: [
        outlineButtonforNotch("Filters", Icons.sort, ()async{
              dataFiltered = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SearchScreen())
          );
          filterData(dataFiltered);
        }),
        Text("$totalInterns total internships"),
        const SizedBox(height: 10,),
      ],
    ),
  );
}
  removeMonth(dataFiltered, Function filterData){
    dataFiltered[2]=0;
    filterData(dataFiltered);
  }
  removeProfile(dataFiltered, Function filterData){
    dataFiltered[0]=[];
    filterData(dataFiltered);
  }
  removeCity(dataFiltered, Function filterData){
    dataFiltered[1]=[];
    filterData(dataFiltered);
  }
topNotchforfilter(String totalInterns, context, Function filterData, var filters){
    var dataFiltered=filters;
    int totalFilter=filters[0].length+filters[1].length+filters[2]!=0?1:0;
    if(totalFilter==0){}
    List<Widget>wid=[];
    if(dataFiltered[2]!=0){
          wid.add(outlineButtonwithicon("${dataFiltered[2]} months", (){
      removeMonth(dataFiltered, filterData);}));
    }
    for(int i=0; i<dataFiltered[0].length; i++){
      wid.add(outlineButtonwithicon(dataFiltered[0][i], (){
        removeProfile(dataFiltered, filterData);
      }));
    }
    for(int i=0; i<dataFiltered[1].length; i++){
      wid.add(outlineButtonwithicon(dataFiltered[1][i], (){
        removeCity(dataFiltered, filterData);
      }));
    }


  return totalFilter==0?topNotch(totalInterns, context, filterData) :SizedBox(
    width: 100.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: 30.w,
              child: outlinefilterButtonforNotch("Filters", Icons.sort, ()async{
                    dataFiltered = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SearchScreen())
                );
                filterData(dataFiltered);
              }, totalFilter),
            ),
                
          SizedBox(
            width: 70.w,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: wid
              ),
            ),
          )
          ],
        ),
        
        Text("$totalInterns total internships"),
        const SizedBox(height: 10,),

      ],
    ),
  );
}