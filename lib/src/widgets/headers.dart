import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData icono;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    this.icono, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _HeaderFondo(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon( this.icono, size: 250, color: Colors.white.withOpacity(0.2),),
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitulo, style: TextStyle( fontSize: 20, color: colorBlanco),),
            SizedBox(height: 20),
            Text(this.titulo, style: TextStyle( fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            FaIcon(this.icono, size: 80, color: Colors.white,),
          ],
        )
      ],
    );
  }
}

class _HeaderFondo extends StatelessWidget {

  final Color color2;
  final Color color1;

  const _HeaderFondo({
    Key key, 
    @required this.color2, 
    @required this.color1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            this.color1,
            this.color2
          ]
        )
      ),
    );
  }
}