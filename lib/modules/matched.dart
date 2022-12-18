import 'package:dating_app/modules/detalies.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'match.dart';

class matched extends StatelessWidget {
  int page;
  matched(this.page);

  @override
  Widget build(BuildContext context) {
    if(page==0){return  Stack(
      children:[
      home(),
      match(),]
    );
  }
  else{
    return Stack(
       children:[
     datalies(),
      match(),]
    );
  }
}
}