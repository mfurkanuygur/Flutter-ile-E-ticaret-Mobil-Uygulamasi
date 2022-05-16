import 'package:ecomdersi/auth.dart';
import 'package:ecomdersi/shared/constants.dart';
import 'package:ecomdersi/shared/loading.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xfff3efe4),
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              elevation: 0.0,
              title: Text('Ücretsiz Kayıt Ol'),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Giriş Yap'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Şifre'),
                        validator: (val) => val.length < 6
                            ? 'En az 6 haneli şifre giriniz'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                           ElevatedButton(
                         style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: (){
                          Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                        child: Text("Atla")
                        ),
                        SizedBox(width:155),
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff689F38),
                        ),
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          setState(() => loading = true);
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Lütfen geçerli bir email giriniz';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                     
                        ]
                      ),
                      
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                )),
          );
  }
}
