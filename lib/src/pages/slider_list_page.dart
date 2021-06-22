import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo()
      // body: _ListaTareas(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      )
   );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return ButtonTheme(
      child: ElevatedButton (
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder> (
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.7,
          child: Center(
            child: Text(
              'Crear nueva lista',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
          ),
        ),
        onPressed: (){}
      )
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Naranja', Color(0xffF08F66)),
    _ListItem( 'Family', Color(0xffF2A38A)),
    _ListItem( 'Sibscripciones', Color(0xffF7CDD5)),
    _ListItem( 'Libros', Color(0xffDCEBAF)),
    _ListItem( 'Naranja', Color(0xffF08F66)),
    _ListItem( 'Family', Color(0xffF2A38A)),
    _ListItem( 'Sibscripciones', Color(0xffF7CDD5)),
    _ListItem( 'Libros', Color(0xffDCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 180,
            maxheight: 200,
            child: Container(
              color: Colors.white,
              child: _Titulo(),
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox( height: 100 ,)
          ])
        ) 

      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheight, 
    @required this.maxheight, 
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return SizedBox.expand(
        child: child,
      );

    }
  
    @override
    double get maxExtent => maxheight;
  
    @override
    double get minExtent => minheight;
  
    @override
    bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
      return maxheight != oldDelegate.maxheight || 
             minExtent != oldDelegate.minheight ||
             child != oldDelegate.child;
  }

}


class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,), 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('Nueva', style: TextStyle( color: Color(0xff532128), fontSize: 50),),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),            
            Positioned(
              bottom: 8,
              child: Container(
                width: 140,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),

            Container(
              child: Text('Lista', style: TextStyle( color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

  final items = [
    _ListItem( 'Naranja', Color(0xffF08F66)),
    _ListItem( 'Family', Color(0xffF2A38A)),
    _ListItem( 'Sibscripciones', Color(0xffF7CDD5)),
    _ListItem( 'Libros', Color(0xffDCEBAF)),
    _ListItem( 'Naranja', Color(0xffF08F66)),
    _ListItem( 'Family', Color(0xffF2A38A)),
    _ListItem( 'Sibscripciones', Color(0xffF7CDD5)),
    _ListItem( 'Libros', Color(0xffDCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) { 
        return items[index];
      },
    );
  }
}

class _ListItem extends StatelessWidget {

  final String texto;
  final Color color;

  const _ListItem(
    this.texto,
    this.color
  );
    
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(texto, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}