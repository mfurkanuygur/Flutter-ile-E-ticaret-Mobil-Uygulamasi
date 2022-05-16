import 'package:flutter/material.dart';
import 'ProductsDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Samsung  A72 ",
      "longName": "Samsung Galaxy A72 8GB RAM 128 GB",
      "picture": "assets/images/a72.jpg",
      "price": 3800,
      "productCategory": "Phone",
      "detailText": "Samsung Galaxy A72 8GB RAM 128 GB Snaprdragon 730 işlemci"
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

  var name="";
  var longName="";
  var picture="";
  var price="";
  var detailText="";
  getProduct()async{
    await Firestore.instance
    .collection("Product")
    .document()
    .get()
    .then((gelenVeri) =>setState((){
      name=gelenVeri.data["productName"];
      longName=gelenVeri.data["productLongDetailName"];
      picture= gelenVeri.data["productDetailPicture"];
      price=gelenVeri.data["productDetailPrice"];
      detailText=gelenVeri.data["productDetailText"];
    }));
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                child: InkWell(
                  child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.network(ds['productDetailPicture']),
                ),
                onTap: () {
                  print(ds['productName']);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsDetail(
                    productDetailName: ds['productName'], 
                    productDetailPicture: ds['productDetailPicture'],
                    productDetailPrice: ds['productDetailPrice'],
                    productDetailText: ds['productDetailText'],
                    productLongDetailName: ds['productLongDetailName'],
                                        )));
                },
                )
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
    );
  }
}

// class singleProduct extends StatelessWidget {
//   final productName;
//   final productLongName;
//   final productPicture;
//   final productPrice;
//   final productCategory;
//   final productDetailText;

//   const singleProduct({
//     this.productName,
//     this.productLongName,
//     this.productPicture,
//     this.productPrice,
//     this.productCategory,
//     this.productDetailText,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//           tag: productName,
//           child: Material(
//               child: InkWell(
//             onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (context) => new ProductsDetail(
//                       productDetailName: productName,
//                       productLongDetailName: productLongName,
//                       productDetailPicture: productPicture,
//                       productDetailPrice: productPrice,
//                       productDetailText: productDetailText,
//                     )
//                     )
//                     ), //Basıldığı zaman kullanıcıya bir şey fırlatması göstermesi için

//             child: GridTile(
//               footer: Container(
//                 color: Colors.white,
//                 height: 45,
//                 // margin: EdgeInsets.fromLTRB(0.0, 0, 0, 10.0),
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
//                 child: ListTile(
//                   leading: Text(
//                     productName,
//                     textAlign: TextAlign.left,
//                     style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
//                   ),
//                   title: Text(
//                     "\$$productPrice",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
//                   ),
//                 ),
//               ),
//               child: Image.asset(
//                 productPicture,
//                 fit: BoxFit.fill,
//                 height: 10.0,
//               ),
//             ),
//           ))),
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'ProductsDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
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
    {
      "name": "Hoodie",
      "longName": "MEN - Bej - Hoodie",
      "picture": "assets/images/hoodie2.jpg",
      "price": 50,
      "productCategory": "Dress",
      "detailText": "MEN - Bej - Hoodie - %100 Pamuk"
    },
    {
      "name": "Sony PS5",
      "longName": "Sony PS5 1 TB Oyun Konsolu",
      "picture": "assets/images/ps5.jpg",
      "price": 500,
      "productCategory": "Game Console",
      "detailText": "Sony PS5 1 TB Oyun Konsolu + 2 oyun kolu beyaz Lorem "
          "Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
          ", when an unknown printer took a galley of type and scrambled it to make a "
          "type specimen book. It has survived not only five centuries, but also the "
          "leap into electronic typesetting, remaining essentially unchanged. It was "
          "popularised in the 1960s with the release of Letraset sheets containing Lorem"
          " Ipsum passages, and more recently with desktop publishing software like Aldus"
          " PageMaker including versions of Lorem Ipsum."
          " PageMaker including versions of Lorem Ipsum."
          " PageMaker including versions of Lorem Ipsum."
          " PageMaker including versions of Lorem Ipsum."
    },
  ];
  var name="";
  var longName="";
  var picture="";
  var price="";
  var detailText="";
  getProduct()async{
    await Firestore.instance
    .collection("Product")
    .document()
    .get()
    .then((gelenVeri) =>setState((){
      name=gelenVeri.data["productName"];
      longName=gelenVeri.data["productLongDetailName"];
      picture= gelenVeri.data["productDetailPicture"];
      price=gelenVeri.data["productDetailPrice"];
      detailText=gelenVeri.data["productDetailText"];
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return singleProduct(
            productName: productList[index]["name"],
            productLongName: productList[index]["longName"],
            productPicture: productList[index]["picture"],
            productPrice: productList[index]["price"],
            productCategory: productList[index]["productCategory"],
            productDetailText: productList[index]["detailText"],
          );
        });
  }
}

class singleProduct extends StatelessWidget {
  final productName;
  final productLongName;
  final productPicture;
  final productPrice;
  final productCategory;
  final productDetailText;

  const singleProduct({
    this.productName,
    this.productLongName,
    this.productPicture,
    this.productPrice,
    this.productCategory,
    this.productDetailText,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
              child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductsDetail(
                      productDetailName: productName,
                      productLongDetailName: productLongName,
                      productDetailPicture: productPicture,
                      productDetailPrice: productPrice,
                      productDetailText: productDetailText,
                    ))), //Basıldığı zaman kullanıcıya bir şey fırlatması göstermesi için

            child: GridTile(
              footer: Container(
                color: Colors.white,
                height: 45,
                // margin: EdgeInsets.fromLTRB(0.0, 0, 0, 10.0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
                child: ListTile(
                  leading: Text(
                    productName,
                    textAlign: TextAlign.left,
                    style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                  ),
                  // title: Text(productCategory,style: GoogleFonts.openSans(fontSize: 10,color: Colors.deepOrange,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                  title: Text(
                    "\$$productPrice",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
                  ),
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.fill,
                height: 10.0,
              ),
            ),
          ))),
    );
  }
}

*/
