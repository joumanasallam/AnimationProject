import 'package:dating_app/sheard/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sheard/point.dart';

int i = 0;

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  bool istapped = true;
  bool isdrag = false;
  List<point> p = [
    point(0, 0),
    point(0, 0),
    point(0, 0),
    point(0, 0),
    point(0, 0),
    point(0, 0),
  ];
  List images = [
    "https://th.bing.com/th/id/R.7228eb4441b0ca7e31881e946035161a?rik=4xKyxgKnkchjFA&riu=http%3a%2f%2f3.bp.blogspot.com%2f-MojHh7GpFUs%2fTz970L0aOKI%2fAAAAAAAAHm8%2f3knuS5TNG9k%2fs640%2fimage001.jpg&ehk=jMvlRtVszOQK1Slt%2fPLZ14rpond4w8M9OvzbBd8YHmM%3d&risl=&pid=ImgRaw&r=0",
    "https://2.bp.blogspot.com/-zY9JgB3W5wk/VRGBGDWozfI/AAAAAAAAp2o/UmpUDKKMWOU/s1600/5283283800_a989ddd085_b.jpg",
    "https://th.bing.com/th/id/OIP.-E0Z47U68kH-Cg2A5x2PngHaE7?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.6ceCwMPQtlKHyNU2FpUTpQHaE8?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.XNLdh2eaqsjyj12MGwLHMgHaE7?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/R.d0c57f4832a95cf0062454439b00d005?rik=2pVm1BW0vZA82w&pid=ImgRaw&r=0",
  ];
  var begin = 30.0;
  var end = 30.0;
  var begin1 = 30.0;
  var end1 = 30.0;
  int ind = 5;
  final PageController pageController = PageController();

  void changeindex() {
    if (i == 5) i = 0;
    if (i < 6){ i = i + 1;}
    else
    {  i--;}
    emit(AppSusessState());
  }

  void changeupbottoncolor() {
    istapped = !istapped;
    emit(AppCurrentState());
  }

  scrollphotoAnimationR(int index) {
    p[index].x = 500.0;
    p[index].y = -40.0;
    if (index == 0) {
      for (int i = 0; i < p.length; i++) {
        p[i].x = 0;
        p[i].y = 0;
      }
    }
    changebuttonsize(0);
    isdrag = false;
    emit(AppSusessState());
  }

  scrollphotoAnimationL(int index) {
    p[index].x = -500.0;
    p[index].y = 40.0;
    if (index == 0) {
      for (int i = 0; i < p.length; i++) {
        p[i].x = 0;
        p[i].y = 0;
      }
    }
    changebuttonsize(0);
    isdrag = true;
    emit(AppSusessState());
  }

  changebuttonsize(int index) {
    if (index == 0) {
      if (begin == 30) {
        begin = 0;
        end = 35;
      } else {
        begin = 30;
        end = 30;
      }

      emit(AppSusessState());
    } else {
      if (begin1 == 30) {
        begin1 = 0;
        end1 = 35;
      } else {
        begin1 = 30;
        end1 = 30;
      }
      emit(AppSusessState());
    }
  }

  void remove(int index) {
    if (ind > 0) {
      p[index].x = 500.0;
      p[index].y = -40.0;
      print(index);
      ind = ind - 1;
    }
  }

  void opendetalies(int index) {
    i = index;
    emit(AppCurrentState());
  }

  int returnindex() {
    return i;
  }
}
