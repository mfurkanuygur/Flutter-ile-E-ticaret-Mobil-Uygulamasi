import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var ProductsOnTheCart = [
    {
      "name": "Samsung  A72 ",
      "longName": "Samsung Galaxy A72 8GB RAM 128 GB",
      "picture": "assets/images/a72.jpg",
      "price": 3800,
      "productCategory": "Phone",
      "detailText": "Samsung Galaxy A72 8GB RAM 128 GB Snaprdragon 730 işlemci "
    },
    {
      "name": "Lenovo Flex 5",
      "longName": "Lenovo Flex 5 Intel i5 1135G7 16GB RAM",
      "picture": "assets/images/flex5.jpg",
      "price": 6300,
      "productCategory": "Pc",
      "detailText": "Lenovo Flex 5 Intel i5 1135G7 16GB RAM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ProductsOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            CartProductName: ProductsOnTheCart[index]["name"],
            CartProductPicture: ProductsOnTheCart[index]["picture"],
            CartProductPrice: ProductsOnTheCart[index]["price"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final CartProductName;
  final CartProductLongName;
  final CartProductPicture;
  final CartProductPrice;

  const SingleCartProduct({
    this.CartProductName,
    this.CartProductLongName,
    this.CartProductPicture,
    this.CartProductPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          CartProductPicture,
          width: 50,
        ),
        title: Text(
          CartProductName,
          /*style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )*/
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  "Fiyat:",
                  /*style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: Colors.black,
                    )*/
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text(
                  "\$$CartProductPrice",
                  /*style: GoogleFonts.openSans(
                      fontSize: 13,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    )*/
                )
              ],
            ),
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_drop_up,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(child: Text("1")),
            Expanded(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
