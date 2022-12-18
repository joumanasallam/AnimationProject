import 'package:dating_app/sheard/component/component.dart';
import 'package:flutter/material.dart';

class match extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8) ,
        body: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
            child: Stack(alignment: Alignment.center, children: [
              Container(width: 200,
              height: 300,
              alignment: Alignment.topCenter,child: CircleWaveRoute(),
         
              ),
              Container(
                    
                alignment: Alignment.topLeft,
                child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 900),
                  tween:
                      Tween(begin: Alignment.topLeft, end: Alignment.centerRight),
                  builder: (context, value, child) => Container(
                    alignment: value,
                    width: 350,
                    height: 400,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(color: Colors.white, width: 3),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.XNLdh2eaqsjyj12MGwLHMgHaE7?pid=ImgDet&rs=1"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 900),
                  tween:
                      Tween(begin: Alignment.bottomRight, end: Alignment.centerLeft),
                  builder: (context, value, child) => Container(
                    alignment: value,
                    width: 300,
                    height: 400,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        border: Border.all(color: Colors.white, width: 3),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.XNLdh2eaqsjyj12MGwLHMgHaE7?pid=ImgDet&rs=1"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
              animationbutton(
                  20, 20, () {}, false, false, Icons.favorite, Colors.black)
            ]),
          ),
          const Text("IT`S MATCHED",style: TextStyle(color: Colors.white,fontSize: 40),)
        ],
      ),
    ));
  }
}
