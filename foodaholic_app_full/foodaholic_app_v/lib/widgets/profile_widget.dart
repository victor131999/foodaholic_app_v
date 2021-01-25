import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key key}) : super(key: key);

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
                height: _heigth * 0.50,
                width: _width*1,
                child: Container(
                 decoration: BoxDecoration( 
                    image: DecorationImage(
                        image: AssetImage("assets/images/usuario.png"),
                      fit: BoxFit.cover
                    )
                  )
                )
            ),
 
            Text("Nombre:", style: Theme.of(context).textTheme.headline4),
            Text("Victor Hugo Cuyo Chiluisa", style: Theme.of(context).textTheme.headline5),
            Text("Cédula:", style: Theme.of(context).textTheme.headline4 ),
            Text("0504426325", style: Theme.of(context).textTheme.headline5),
            Text("Correo:", style: Theme.of(context).textTheme.headline4 ),
            Text("victor@hotmail.com", style: Theme.of(context).textTheme.headline5),
            Text("Teléfono:", style: Theme.of(context).textTheme.headline4 ),
            Text("0987964252", style: Theme.of(context).textTheme.headline5),
            Text("Dirección:", style: Theme.of(context).textTheme.headline4 ),
            Text("Pujilí", style: Theme.of(context).textTheme.headline5),
          
          ],
        ),
      ),
    );
  }
}