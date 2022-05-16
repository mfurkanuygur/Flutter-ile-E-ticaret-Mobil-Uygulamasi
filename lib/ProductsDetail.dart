/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';

class ProductsDetail extends StatefulWidget {
  final productDetailName;
  final productLongDetailName;
  final productDetailPicture;
  final productDetailPrice;
  final productDetailText;
  // final productDetailCategory;
  ProductsDetail({
    this.productDetailName,
    this.productLongDetailName,
    this.productDetailPicture,
    this.productDetailPrice,
    this.productDetailText,
  });
  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.productDetailName,
        ),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          /*Butona tıklama fonksiyonu verildi(içi boş şimdilik)*/
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
        ],
      ), 
      body:
       
      StreamBuilder(
        stream: Firestore.instance.collection("Product").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.documents
                .map((doc) => print(doc["productName"])));
            return GridView.builder(
            itemCount: snapshot.data.documents.length,
            gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return GridTile(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5,0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.network(ds['productDetailPicture']),
                    // child: Image.asset(
                    //   'assets/images/a72.jpg',
                    //   fit: BoxFit.fitWidth,
                    //   alignment: Alignment.topCenter
                    // ),
                  ),
                ),
                //  header: Padding(
                //    padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
                //    child: Text(ds['productName'],style: TextStyle(color:Colors.blue,backgroundColor: Colors.cyan),),
                //  ),
                
                footer: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5,15),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            child: Text(ds['productName'],style: TextStyle(color:Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                            
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(child:Text(ds['productDetailPrice'],style: TextStyle(color:Colors.deepOrange,fontSize: 14,fontWeight: FontWeight.bold )),),
                        )
                        
                        // Text(ds['productName'],style: TextStyle(color:Colors.black,backgroundColor: Colors.red)),
                        // SizedBox(width:50,),
                        // Text(ds['productDetailPrice'],style: TextStyle(color:Colors.black ),textAlign: TextAlign.right,),
                      ],
                    ),
                  ),
                ),
              );
            });
    
          }
          return Text("Boşluk");
        }
      ),
    );
  }
}*/

///tuna ayrım

////////////////////////////////////////////////////////////////////////////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';

class ProductsDetail extends StatefulWidget {
  final productDetailName;
  final productLongDetailName;
  final productDetailPicture;
  final productDetailPrice;
  final productDetailText;
  // final productDetailCategory;
  ProductsDetail({
    this.productDetailName,
    this.productLongDetailName,
    this.productDetailPicture,
    this.productDetailPrice,
    this.productDetailText,
  });
  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.productDetailName,
        ),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          /*Butona tıklama fonksiyonu verildi(içi boş şimdilik)*/
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
        ],
      ),
      body: new ListView(
        
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                  widget.productDetailPicture,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            height: 45.0,
            child: ListTile(
              leading: Text(
                widget.productLongDetailName,
                style: TextStyle(fontSize:13,fontWeight: FontWeight.bold ),
              ),
              title: Text(
                "\$${widget.productDetailPrice}",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange,fontSize: 17),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
//Favorilere ekle butonu ve uyarısı
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Favorilere Eklendi",style: TextStyle(fontSize: 13),),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Alışverişe Devam Et",style: TextStyle(fontSize: 13),),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(children: [
//ıCON BUTTON İÇİNE faVORİLERE EKLENDİ UYARISI
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.deepOrange,
                        size: 18.0,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Favorilere Eklendi",
                                  style: TextStyle(fontSize: 13),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      "Alışverişe Devam Et",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                    ),
                    Text(
                      "Favorilere Ekle",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ]),
                )),
//Sepete Ekle butonu ve uyarısı
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Sepete Eklendi",
                              style: TextStyle(fontSize: 13),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "Alışverişe Devam Et",
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.deepOrange,
                  child: Row(children: [
//İCON BUTTON İÇİNE SEPETE EKLENDİ UYARISI
                    IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Sepete Eklendi",
                                  style: TextStyle(fontSize: 13),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      "Alışverişe Devam Et",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                    ),
                    Text(
                      "Sepete Ekle",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ]),
                )),

                // IconButton(
                //   icon: Icon(Icons.favorite_border,color: Colors.deepOrange,size: 20,),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Ürün Detayları",
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.productDetailText),
          ),
        ],
      ),
    );
  }
}
