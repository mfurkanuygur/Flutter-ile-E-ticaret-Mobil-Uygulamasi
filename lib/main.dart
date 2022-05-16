import 'package:ecomdersi/Home.dart';
import 'package:ecomdersi/auth.dart';
import 'package:ecomdersi/user.dart';
import 'package:ecomdersi/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/painting.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'imageCarousel.dart';
// import 'horizontalListView.dart';
// import 'ProductsGrid.dart';
// import 'Cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
