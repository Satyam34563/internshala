import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/optionselect.dart';
import 'package:flutter_application_1/widgets.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({super.key, required this.result, required this.dataReq, required this.name, required this.callbackfunction});
  List<String>result;
  List<String>dataReq;
  String name;
  final Function callbackfunction;
  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  List<Padding>cityBtn=[];
  runFun(){
    cityBtn=[];
    for(int i=0; i<widget.result.length; i++){
      cityBtn.add(outlineButtonwithicon(widget.result[i], (){}));
    }
    setState(() {
      cityBtn;
    });
    widget.callbackfunction(widget.result, widget.name);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Padding(
            padding: const EdgeInsets.only(left:18.0, top:10, bottom: 0),
            child: Text(widget.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
        ),
        Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Wrap(
                children: cityBtn,
              ),
            ),
        TextButton(onPressed:() async {
            widget.result = await Navigator.push(context, MaterialPageRoute(
            builder: (context) => OptionSelect(st: widget.dataReq, name: widget.name,))
          );
          runFun();
        }, child:  Row(
          children: [
            const Icon(Icons.add, color: Colors.blue,),
            const SizedBox(width: 15,),
            Text("Add ${widget.name}", style:const TextStyle(color: Colors.blue, fontSize: 16)),
          ],
        ))
      ],
    );
  }
}