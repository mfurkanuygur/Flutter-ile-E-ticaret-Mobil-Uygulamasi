import 'package:ecomdersi/Products.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({ Key key }) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //resizeToAvoidBottomPadding
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Favorilerim",
        ),
        backgroundColor: Colors.deepOrange,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
          /*Butona tıklama fonksiyonu verildi(içi boş şimdilik)*/
        ],
      ),
      body: Products(),
    );
  }
}