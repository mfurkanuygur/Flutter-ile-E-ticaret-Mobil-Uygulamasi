import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3efe4),
      child: Center(
        child: SpinKitThreeBounce(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
