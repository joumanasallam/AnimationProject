import 'package:dating_app/modules/detalies.dart';
import 'package:dating_app/sheard/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import '../../sheard/cubit/cubit.dart';
import '../../sheard/cubit/states.dart';

import 'matched.dart';

class home extends StatelessWidget {
  double _top=0.0;
double _left=0.0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, Appstates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                body: Container(
                    height: 1000,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(colors: [
                      Colors.blue.withOpacity(0.5),
                      const Color(0xFF141417),
                    ], radius: 0.9)),
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        AppCubit.get(context)
                                            .changeupbottoncolor();
                                      },
                                      child: defaultbutton("For You",
                                          AppCubit.get(context).istapped, 90)),
                                  InkWell(
                                      onTap: () {
                                        AppCubit.get(context)
                                            .changeupbottoncolor();
                                      },
                                      child: defaultbutton("Nearby",
                                          !AppCubit.get(context).istapped, 90))
                                ],
                              ),
                              defaultbutton("...", false, 40)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(alignment: Alignment.bottomCenter, children: [
                            card(
                              0,
                              270,
                              380,
                              () {
                                AppCubit.get(context).scrollphotoAnimationR(0);
                              },
                              AppCubit.get(context).p[0].x,
                              AppCubit.get(context).p[0].y,
                               (){
                                  AppCubit.get(context).opendetalies(0);
                                 navigator(context, datalies());
                                }
                              
                            ),
                            card(1, 280, 380, () {
                              AppCubit.get(context).scrollphotoAnimationR(1);
                            }, AppCubit.get(context).p[1].x,
                                AppCubit.get(context).p[1].y,
                                (){
                                  AppCubit.get(context).opendetalies(1);
                                 navigator(context, datalies());
                                }
                              ),
                            card(2, 290, 370, () {
                              AppCubit.get(context).scrollphotoAnimationR(2);
                            }, AppCubit.get(context).p[2].x,
                                AppCubit.get(context).p[2].y,
                                 (){
                                  AppCubit.get(context).opendetalies(2);
                                 navigator(context, datalies());
                                }
                             ),
                            card(3, 300, 370, () {
                              AppCubit.get(context).scrollphotoAnimationR(3);
                            }, AppCubit.get(context).p[3].x,
                                AppCubit.get(context).p[3].y,
                                 (){
                                  AppCubit.get(context).opendetalies(3);
                                 navigator(context, datalies());
                                }
                            ),
                            card(4, 310, 360, () {
                              AppCubit.get(context).scrollphotoAnimationR(4);
                            }, AppCubit.get(context).p[4].x,
                                AppCubit.get(context).p[4].y,
                                 (){
                                  AppCubit.get(context).opendetalies(4);
                                 navigator(context, datalies());
                                }
                               ),
                            card(5, 320, 360, () {
                              AppCubit.get(context).scrollphotoAnimationR(5);
                             
                            }, AppCubit.get(context).p[5].x,
                                AppCubit.get(context).p[5].y,
                                 (){
                                  AppCubit.get(context).opendetalies(5);
                                 navigator(context, datalies());
                                }
                              ),
                              
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: animationbutton(
                                        AppCubit.get(context).begin,
                                        AppCubit.get(context).end,
                                        () {
                                          AppCubit.get(context)
                                              .changebuttonsize(0);
                                          AppCubit.get(context).remove(
                                              AppCubit.get(context).ind);
                                        },
                                        true,
                                        true,
                                        Icons.close,
                                        Colors.white
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: animationbutton(
                                        AppCubit.get(context).begin1,
                                        AppCubit.get(context).end1,
                                        () {
                                          AppCubit.get(context)
                                              .changebuttonsize(1);
                                                navigator(context, matched(0));
                                        },
                                        false,
                                        false,
                                        Icons.favorite,
                                        Colors.white
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )));
          }),
    );
  }
}
