import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget defaultbutton(
  String title,
  bool istapped,
  double width,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
    child: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: istapped
                  ? const [
                      Color(0xFFF94BBB),
                      Color(0xFFF94BBB),
                      Colors.pinkAccent,
                    ]
                  : [
                      Colors.grey.withOpacity(0.3),
                      Colors.grey.withOpacity(0.3),
                    ]),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      )),
    ),
  );
}

Widget animationbutton(double begin, double end, dynamic fun, bool color,
    bool color1, IconData icon, Color c) {
  return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 250),
      tween: Tween<double>(begin: begin, end: end),
      builder: (context, value, child) {
        return InkWell(
          onTap: fun,
          child: CircleAvatar(
            radius: value,
            backgroundColor: color ? c : const Color(0xFFF94BBB),
            foregroundColor: color1 ? const Color(0xFFF94BBB) : Colors.white,
            child: Icon(icon, size: value),
          ),
        );
      });
}

List images = [
  "https://th.bing.com/th/id/R.7228eb4441b0ca7e31881e946035161a?rik=4xKyxgKnkchjFA&riu=http%3a%2f%2f3.bp.blogspot.com%2f-MojHh7GpFUs%2fTz970L0aOKI%2fAAAAAAAAHm8%2f3knuS5TNG9k%2fs640%2fimage001.jpg&ehk=jMvlRtVszOQK1Slt%2fPLZ14rpond4w8M9OvzbBd8YHmM%3d&risl=&pid=ImgRaw&r=0",
  "https://2.bp.blogspot.com/-zY9JgB3W5wk/VRGBGDWozfI/AAAAAAAAp2o/UmpUDKKMWOU/s1600/5283283800_a989ddd085_b.jpg",
  "https://th.bing.com/th/id/OIP.-E0Z47U68kH-Cg2A5x2PngHaE7?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/OIP.6ceCwMPQtlKHyNU2FpUTpQHaE8?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/OIP.XNLdh2eaqsjyj12MGwLHMgHaE7?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/R.d0c57f4832a95cf0062454439b00d005?rik=2pVm1BW0vZA82w&pid=ImgRaw&r=0",
];

Widget card(int indexx, double width, double hieght, dynamic fun, double x,
    double y, dynamic fun2) {
  return AnimatedContainer(
    transform: Matrix4.translationValues(x, y, 0),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(images[indexx]), fit: BoxFit.fill),
        color: Colors.black,
        borderRadius: BorderRadius.circular(20)),
    width: width,
    height: hieght,
    duration: const Duration(seconds: 1),
    child: InkWell(
      onDoubleTap: fun,
      onTap: fun2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                  6,
                  (index) => Container(
                        margin: const EdgeInsets.all(3),
                        child: Icon(Icons.circle,
                            size: 10.0,
                            color: indexx == index
                                ? const Color(0xFFF94BBB)
                                : Colors.white),
                      )).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

navigator(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

class CircleWaveRoute extends StatefulWidget {
  @override
  _CircleWaveRouteState createState() => _CircleWaveRouteState();
}

class _CircleWaveRouteState extends State<CircleWaveRoute>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 100.0;
  late Animation<double> _animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: waveGap).animate(controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CircleWavePainter(waveRadius),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CircleWavePainter extends CustomPainter {
  final double waveRadius;
  var wavePaint;
  CircleWavePainter(this.waveRadius) {
    wavePaint = Paint()
      ..color = Color(0xFFF94BBB).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = waveRadius / 50
      ..isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double maxRadius = hypot(centerX, centerY);

    var currentRadius = waveRadius;
    while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 20.0;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }

  double hypot(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
