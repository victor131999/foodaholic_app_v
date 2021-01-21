import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';

class CurrentSpecialWidget extends StatelessWidget {

  const CurrentSpecialWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    int _current = 0;
  
    final List<String> imgList = [
      'https://www.ecured.cu/images/4/40/Hamburguesa1.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Shawarma_%283157609887%29.jpg/1200px-Shawarma_%283157609887%29.jpg',
      'https://www.mrpollo.com.ec/images/articulos/2017/06/historia_2.jpg',
      'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/imj/elgranchef/O/Origen-de-las-papas-fitas-1.jpg',
      'https://saposyprincesas.elmundo.es/wp-content/uploads/2017/01/comida-india-langostinos-tandoori.jpg',
      'https://live.mrf.io/statics/i/ps/www.cocinacaserayfacil.net/wp-content/uploads/2019/11/Comida-china.jpg?width=1200&enable=upscale'
    ];

  final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. ${imgList.indexOf(item)} nombre',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
)).toList();

    double _heigth=MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return Scaffold(
      appBar: AppBar(title: Text('Especiales de Food Holic')),
      body: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                 {
                  _current = index;
                }
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
      ),
    );

  }


@override
  Widget down(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }),
    );
  }

}