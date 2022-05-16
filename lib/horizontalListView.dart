//CategoriesListView

import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//Dikey olarak yükseklik verir. Nereye verir: yatay kaydırma düzlemine verir
      height: 110.0,
      child: ListView(
//Tanımlanan listenin yatay düzlemde kaydırma hareketi (Misal insta storyies)
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: "assets/images/TelefonTablet.jpg",
            image_caption: "Telefon",
          ),
          Category(
            image_location: "assets/images/Pc.jpg",
            image_caption: "Bilgisayar",
          ),
          Category(
            image_location: "assets/images/tv.jpg",
            image_caption: "Televizyon",
          ),
          Category(
            image_location: "assets/images/moda.jpg",
            image_caption: "Moda",
          ),
          Category(
            image_location: "assets/images/bebe.jpg",
            image_caption: "Anne Bebek",
          ),
          Category(
            image_location: "assets/images/oto.jpg",
            image_caption: "Oto Aksesuar",
          ),
          Category(
            image_location: "assets/images/ps.jpg",
            image_caption: "Oyun Konsolları",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  const Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          //Burayı bir resmin kapladığı genişlik olarak düşün
          width: 130.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}
