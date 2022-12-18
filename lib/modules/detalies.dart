import 'package:dating_app/modules/match.dart';
import 'package:dating_app/modules/matched.dart';
import 'package:dating_app/sheard/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sheard/component/component.dart';
import '../sheard/cubit/states.dart';


class datalies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, Appstates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              body: Column(
                children: [
                  SafeArea(
                    child: SizedBox(
                        height: 480,
                        child: PageView.builder(
                            controller: cubit.pageController,
                            onPageChanged: (index) {
                              cubit.changeindex();
                            },
                            itemCount: cubit.images.length,
                            itemBuilder: (_, index) {
                              index = cubit.returnindex();
                             
                              return AnimatedBuilder(
                                animation: cubit.pageController,
                                builder: (context, child) {
                                  return child!;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(cubit.images[index]),
                                    ),
                                  ),
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: List.generate(
                                              6,
                                              (index) => Container(
                                                    // color: Colors.grey.withOpacity(0.5),
                                                    margin: const EdgeInsets.all(3),
                                                    child: Icon(Icons.circle,
                                                        size: 10.0,
                                                        color:
                                                            cubit.returnindex() ==
                                                                    index
                                                                ? Color(
                                                                    0xFFF94BBB)
                                                                : Colors.white),
                                                  )).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: animationbutton(AppCubit.get(context).begin,
                                AppCubit.get(context).end, () {
                              AppCubit.get(context).changebuttonsize(0);
                              cubit.changeindex();
                            }, true, false, Icons.close, Colors.grey)),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: animationbutton(AppCubit.get(context).begin1,
                                AppCubit.get(context).end1, () {
                              AppCubit.get(context).changebuttonsize(1);
                              navigator(context, matched(1));
                            }, false, false, Icons.favorite,
                                Colors.grey[700]!)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

