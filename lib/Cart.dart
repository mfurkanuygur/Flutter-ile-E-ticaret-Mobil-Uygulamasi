import 'package:flutter/material.dart';
import 'CartProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Sepetim",
          /*style: GoogleFonts.openSans(),*/
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

      body: CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text(
                "Toplam Tutar ",
                /*style: GoogleFonts.openSans(
                  fontSize: 13,
                  color: Colors.deepOrange,
                ),*/
                textAlign: TextAlign.center,
              ),
              subtitle: Text("\$230",
                  /*style: GoogleFonts.openSans(
                    fontSize: 16,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),*/
                  textAlign: TextAlign.center),
            )),
            Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepOrange,
                  child: Text(
                    "Alışverişi Tamamla",
                    /*style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )*/
                  )),
            )
          ],
        ),
      ),
    );
  }
}
