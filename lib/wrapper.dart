import 'package:ecomdersi/Home.dart';
import 'package:ecomdersi/authenticate.dart';
import 'package:ecomdersi/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    //this will return depends on authentication
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
