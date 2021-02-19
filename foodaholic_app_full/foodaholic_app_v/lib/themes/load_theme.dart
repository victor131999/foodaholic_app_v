import 'dart:math';
import 'package:vector_math/vector_math.dart' as Vector;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';

class LoadTheme extends StatefulWidget {
  LoadTheme({Key key}) : super(key: key);
    @override  _LoadThemeState createState() => new _LoadThemeState();
    
     
    
}
class _LoadThemeState extends State<LoadTheme> {  

  @override  Widget build(BuildContext context) {    
    Size size = new Size(MediaQuery.of(context).size.width, 900.0); 
  return new Scaffold(      
    backgroundColor: ThemeMain().fondanime,
    body: new Stack(        
      children: <Widget>[     
        new ColorCurveBody(size: size, xOffset: 1, yOffset: 250, color: ThemeMain().primaryfond),
        /*Align(
          alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: ThemeMain().primaryAccent,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/loading.gif'),
            )
        ),*/

      ],      
    ),    
  );  
  }
}

class ColorCurveBody extends StatefulWidget {  
  final Size size;  final int xOffset;  
  final int yOffset;  final Color color;  
  ColorCurveBody(      
    {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
    : super(key: key);

@override  
State<StatefulWidget> createState() {    
  return new _ColorCurveBodyState();  
  }
}

class _ColorCurveBodyState extends State<ColorCurveBody>   
 with TickerProviderStateMixin {  
   AnimationController animationController;  
   List<Offset> animList1 = []; 
  @override  
  void initState() {    
    super.initState();    
    animationController = new AnimationController(        
      vsync: this, duration: new Duration(seconds: 2));    
      animationController.addListener(() {      
        animList1.clear();      
        for (int i = -2 - widget.xOffset;          
        i <= widget.size.width.toInt() + 2;          
        i++) {        
          animList1.add(new Offset(            
            i.toDouble() + widget.xOffset,            
            sin((animationController.value * 360 - i) %                        
            360 *                        
            Vector.degrees2Radians) *                    
            20 +                
            50 +                
            widget.yOffset));      
            }    
      });    
      animationController.repeat();  
  }    
  
  @override  
  void dispose() {    
    animationController.dispose();    
    super.dispose();  
  }  
  
  @override  
  Widget build(BuildContext context) {    
    return new Container(      
      alignment: Alignment.center,      
      child: new AnimatedBuilder(        
        animation: new CurvedAnimation(          
          parent: animationController,          
          curve: Curves.easeInOut,        
        ),        
        builder: (context, child) => new ClipPath(              
          child: widget.color == null                  
          ? Image.network(                      
            '',                      
            width: widget.size.width,                      
            height: widget.size.height,                      
            fit: BoxFit.cover,                    
            )                  
            : new Container(                     
               width: widget.size.width,                     
               height: widget.size.height,                      
               color: widget.color,                   
               ),              
               clipper: new WaveClipper(animationController.value, animList1),            
               ),      
      ),    
    );  
  }}
  
  class WaveClipper extends CustomClipper<Path> {  
    final double animation;  
    List<Offset> waveList1 = [];  
    WaveClipper(this.animation, this.waveList1);  
    
  @override  
  Path getClip(Size size) {    
    Path path = new Path();    
    path.addPolygon(waveList1, false);    
    path.lineTo(size.width, size.height);    
    path.lineTo(0.0, size.height);    
    path.close();    
    return path;  
  }  
  
  @override  
  bool shouldReclip(WaveClipper oldClipper) =>      
  animation != oldClipper.animation;
  }