import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushNamedAndRemoveUntil(context, 'HomePage', (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 30,),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Container(
                  height: 280,
                  child: Image.network('https://th.bing.com/th/id/R.7d64f36856750fa5fb4e1aff7cfc705d?rik=AF3Hq50kmgmZDg&riu=http%3a%2f%2fpa1.narvii.com%2f6919%2f98da0921710f32dc93296aacbcf4b9321e9baf9fr1-320-226_00.gif&ehk=ggtES95tt54q%2bc8tUhY2%2bkp2jJZvE1o5z0G5xSKYGw8%3d&risl=&pid=ImgRaw&r=0')),
              ),
              Container(
                height: 300,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("INTERN", style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.w600
                    ),),
                    Text("SHALA", style: TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ],
          ),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.verified_outlined, color: Colors.blue, size: 30,),
                SizedBox(height: 10,),
                Text("Trusted by over 21 Million", style:TextStyle(fontWeight: FontWeight.w600)),
                Text("College students & Graduates", style:TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
    );
  }
}