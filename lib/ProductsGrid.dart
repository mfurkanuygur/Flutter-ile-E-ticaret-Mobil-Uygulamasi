import 'package:flutter/material.dart';
import 'Products.dart';

class ProductsGrid extends StatefulWidget {
  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Products(),
    );
  }
}
