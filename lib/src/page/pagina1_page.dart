import 'package:flutter/material.dart';
import 'package:transiciones_app/src/page/pagina2_page.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: Center(
        child: Text('Pagina1'),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.chevron_right),
       onPressed: () {
         Navigator.push(context, _crearRuta());
       },
     ),
   );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> animationSecondary) => Pagina2Page(),
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context , animation, animationSecondary, child ) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        // return SlideTransition(
        //   position: Tween<Offset>(begin: Offset(0.5, 1.0) , end: Offset.zero).animate(curvedAnimation),
        //   child: child,
        // );
        
        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );
         
        // return RotationTransition(
        //   turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        // return FadeTransition(
        //   opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );
        
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset(1.0, 0.0) , end: Offset.zero).animate(curvedAnimation),
            child: child
          )
        );

      }
    );
  }

}