import 'dart:io';

import 'package:ecomdersi/Home.dart';
import 'package:ecomdersi/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'Cart.dart';
import 'auth.dart';

class AddProductDatabasePage extends StatefulWidget {
  // const AddProductDatabasePage({ Key key }) : super(key: key);
  // final productName;
  // final productLongDetailName;
  // final productDetailPicture;
  // final productDetailPrice;
  // final productDetailText;
  // AddProductDatabasePage({
  //   this.productName,
  //   this.productLongDetailName,
  //   this.productDetailPicture,
  //   this.productDetailPrice,
  //   this.productDetailText,

  // });

  @override
  _AddProductDatabasePageState createState() => _AddProductDatabasePageState();
}

class _AddProductDatabasePageState extends State<AddProductDatabasePage> {
  final AuthService _auth = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  File yuklenecekDosya;
  String indirmeBaglantisi;

  String _pictureURL;

  // galeridenAl() async {
  //   var alinanDosya=await ImagePicker().getImage(source: ImageSource.gallery);
  //   setState(() {
  //     yuklenecekDosya=File(alinanDosya.path);
  //   });
  //   StorageReference referansYol=FirebaseStorage.instance
  //   .ref()
  //   .child("resimler")
  //   .child("");
  //   // .child(auth.currentUser.) ;
  //   //  üst kısımda normalde bu var ama hata var
  //   // .child("resim.jpg");
  //   StorageUploadTask yuklemeGorevi= referansYol.putFile(yuklenecekDosya);
  //   String url = await (await yuklemeGorevi.onComplete).ref.getDownloadURL();
  //   setState(() {
  //     indirmeBaglantisi=url;
  //   });
  // }
  File _imageFile;
  final picker = ImagePicker();
  String urlUzanti;
  //picker function use it to pick button
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  //uploading button
  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => {
            print("Done: $value"),
            urunEkle(value),
            },
          
        );
        setState(() {
          urlUzanti = fileName;
        });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () { 
        Navigator.of(context).pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Mesaj"),
      content: Text("Ürün başarıyla eklendi"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // var firebaseUser =FirebaseAuth.instance.currentUser();
  TextEditingController productName = TextEditingController();
  TextEditingController productLongDetailName = TextEditingController();
  TextEditingController productDetailText = TextEditingController();
  TextEditingController productDetailPrice = TextEditingController();
  TextEditingController productDetailPicture = TextEditingController();

  urunEkle(String _pictureURL) async {
    await Firestore.instance.collection("Product").document().setData({
      'productName': productName.text,
      'productLongDetailName': productLongDetailName.text,
      'productDetailPrice': productDetailPrice.text,
      'productDetailText': productDetailText.text,
      'productDetailPicture': _pictureURL,
    });
  }


  // urunGuncelle() async {
  //   await Firestore.instance.collection("Product").document().updateData({
  //     'productName': productName.text,
  //     'productLongDetailName': productLongDetailName.text,
  //     'productDetailPrice': productDetailPrice.text,
  //     'productDetailText': productDetailText.text,
  //     'productDetailPicture': productDetailPicture.text
  //   });
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    productName.dispose();
    productLongDetailName.dispose();
    productDetailPrice.dispose();
    productDetailText.dispose();
    productDetailPicture.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add Product"),
        backgroundColor: Colors.deepOrange,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
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
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
////////////////////////////////////         Product Name
                    TextFormField(
                      controller: productName,
                      decoration: textInputDecoration.copyWith(
                          hintText: "Product Name"),
                      validator: (val) =>
                          val.isEmpty ? 'Ürün İsmi Giriniz' : null,
                    ),
////////////////////////////////////       Product Long Detail Name
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: productLongDetailName,
                      decoration: textInputDecoration.copyWith(
                          hintText: "Product Long Detail Name"),
                      validator: (val) =>
                          val.isEmpty ? 'Ürün İsminin Detaylıca Giriniz' : null,
                    ),
////////////////////////////////////      Product Picture
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lütfen Resim Seçiniz:",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          SizedBox(width: 100),
                          ElevatedButton(
                              // onPressed: galeridenAl,
                              onPressed: pickImage,
                              child: Text("Resim Yükle"))
                        ],
                      ),
                    ),
                    // TextFormField(
                    //   controller: productDetailPicture,
                    //   decoration:
                    //       textInputDecoration.copyWith(hintText: "Product Picture"),
                    //   validator: (val) => val.isEmpty ? 'Resim Ekleyiniz' : null,
                    // ),
                    SizedBox(
                      height: 15.0,
                    ),
////////////////////////////////////            Product Detail
                    TextFormField(
                      controller: productDetailText,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      decoration: textInputDecoration.copyWith(
                          hintText: "Product Details"),
                      validator: (val) =>
                          val.isEmpty ? 'Ürün Detaylarını Giriniz' : null,
                    ),
                    SizedBox(height: 15.0),
///////////////////////////////////       Product Price
                    TextFormField(
                      controller: productDetailPrice,
                      decoration: textInputDecoration.copyWith(
                          hintText: "Product Price"),
                      validator: (val) =>
                          val.isEmpty ? 'Ürün Fiyatını Giriniz' : null,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      // ElevatedButton(
                      //     onPressed: () {
                      //       urunGuncelle();
                      //     },
                      //     child: Text("Güncelle")),
                      SizedBox(width: 25),
                      ElevatedButton(
                         onPressed: () {
                            uploadImageToFirebase(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            showAlertDialog(context);
                         }, 
                        child: Text("Ekle")),
                    ]),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
