import 'package:ecomdersi/AddProductDatabasePage.dart';
import 'package:ecomdersi/Favourites.dart';
import 'package:ecomdersi/ProductsDetail.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'ProductsGrid.dart';
import 'auth.dart';
import 'horizontalListView.dart';
import 'imageCarousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Ecommerce",
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
            /*Butona tıkla a fonksiyonu verildi(içi boş şimdilik)*/
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();             
                    
              },
            ),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              //Menu Başlığı
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Menu",
                  style: TextStyle(fontSize: 18.0),
                ),
                accountEmail: null,
                decoration: BoxDecoration(color: Colors.deepOrange),
                /*currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu,color: Colors.deepOrange,),
                ),
              ),*/
              ),
              //Menu Alt Başlıkları
              InkWell(
                //Normal bir widgetı buton yapmak için
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                child: ListTile(
                  title: Text("Anasayfa"),
                  leading: Icon(
                    Icons.home,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              // InkWell(
              //   //Normal bir widgetı buton yapmak için
              //   onTap: () {},
              //   child: ListTile(
              //     title: Text("Kategoriler"),
              //     leading: Icon(
              //       Icons.category,
              //       color: Colors.deepOrange,
              //     ),
              //   ),
              // ),
              InkWell(
                //Normal bir widgetı buton yapmak için
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: ListTile(
                  title: Text("Sepetim"),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              // InkWell(
              //   //Normal bir widgetı buton yapmak için
              //   onTap: () {},
              //   child: ListTile(
              //     title: Text("Siparişlerim"),
              //     leading: Icon(
              //       Icons.shopping_basket,
              //       color: Colors.deepOrange,
              //     ),
              //   ),
              // ),
              InkWell(
                //Normal bir widgetı buton yapmak için
                onTap: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProductsDetail()));
                },
                child: ListTile(
                  title: Text("Favorilerim"),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              
              Divider(),
              InkWell(
                //Normal bir widgetı buton yapmak için
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductDatabasePage()));
                },
                child: ListTile(
                  title: Text("Ürün Ekle"),
                  leading: Icon(
                    Icons.library_add,
                    color: Colors.black,
                  ),
                ),
              ),
              // InkWell(
              //   //Normal bir widgetı buton yapmak için
              //   onTap: () {},
              //   child: ListTile(
              //     title: Text("Hakkımızda"),
              //     leading: Icon(
              //       Icons.help,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
//Column içinde Flexible(ProductsGrid()) eklnebelir
        body: ListView(
          children: [
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
            //   child: Text(
            //     "Kategoriler",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Divider(
            //   color: Colors.deepOrange,
            //   thickness: 1.25,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            // HorizontalList(),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
            //   child: Text(
            //     "Bugüne Özel",
            //   ),
            // ),
            // Divider(
            //   color: Colors.deepOrange,
            //   thickness: 1.25,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ImageCarousel(),
            // ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 2.0, 0, 0),
              child: Text(
                "Ürünler",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.deepOrange,
              thickness: 1.25,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ProductsGrid(),
            ),

            // Container(
            //   child: ProductsGrid()
            // ),
            // Divider(color: Colors.deepOrange,thickness: 1.25,indent: 10,endIndent: 10,),
          ],
        ),
      ),
    );
  }
}
