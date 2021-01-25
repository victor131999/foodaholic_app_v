import 'package:flutter/material.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    print("Altura: $_heigth");

    return SingleChildScrollView(
      child: Container(
        color: Colors.orange[100],
        child: Column(
          children: [
            SizedBox(
                height: _heigth * 0.15,
                width: _width*0.90,
                child: Container(
                 decoration: BoxDecoration( 
                    image: DecorationImage(
                        image: AssetImage("assets/images/FoodaHolic.png"),
                      fit: BoxFit.cover
                    )
                  )
                )
            ),
 
            Text("Ubicación:", style: Theme.of(context).textTheme.headline4),
            SizedBox(
                width: _width*0.90,
                height: _heigth * 0.50,
                child: Container(
                  color: Colors.amber,
                )
            ),
            
            Text("Contactos:", style: Theme.of(context).textTheme.headline4),
            Text("09998805083", style: Theme.of(context).textTheme.headline5),
            Text("Atención:", style: Theme.of(context).textTheme.headline4 ),
            Text("Lunes a viernes de 08:00am hasta 10:00pm", style: Theme.of(context).textTheme.headline5),
            Text("Correo:", style: Theme.of(context).textTheme.headline4 ),
            Text("foodaholic@hotmail.com", style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}