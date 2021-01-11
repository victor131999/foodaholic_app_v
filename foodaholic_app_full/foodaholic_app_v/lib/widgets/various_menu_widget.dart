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
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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


}