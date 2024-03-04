import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class OptionSelect extends StatefulWidget {
  OptionSelect({super.key, required this.st, required this.name});
  List<String>st;
  String name;
  @override
  State<OptionSelect> createState() => _OptionSelectState();
}

class _OptionSelectState extends State<OptionSelect> {
  TextEditingController _controller = TextEditingController();
  List<Map>map=[];
  List<Map>backupMap=[];
  _runFun(){
    for(int j=0; j<widget.st.length; j++){
      map.add({"name":widget.st[j], "is_checked":false});
    }
    backupMap=map;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _runFun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        leadingWidth: 30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.name, style:const TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
            Row(
              children: [
                textButton("Clear all", () { __clearAll();}),
                elevatedButton("Apply", () {__applyFunction(); })
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          searchBar(_controller, (value){
            _inputChangeFun(value);
          }),
          SizedBox(
            height:80.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: map.map((e){
                return CheckboxListTile(
                  title: Text(e["name"]),
                  value: e["is_checked"], onChanged:(value) {
                  setState(() {
                    e["is_checked"]=value!;
                  });
                },);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
__clearAll(){
    for(Map i in backupMap){
      i["is_checked"]=false;
    }
  setState(() {
    _controller.text="";
    map=backupMap;
  });
}
__applyFunction(){
  List<String>datatobesent=[];
  for(Map i in map){
      if(i["is_checked"]==true){
        datatobesent.add(i["name"]);
      }
  }
  Navigator.of(context).pop(datatobesent);
}
_inputChangeFun(String s){
  List<Map>filter=[];
    if(s.isEmpty){
      filter=backupMap;
    }else{
      filter=backupMap.where((element) => element["name"].toLowerCase().contains(s.toLowerCase())).toList();
    }
    setState(() {
      map=filter;
    });
  }
}
