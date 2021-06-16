import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

 HomePage({
    Key key 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Color> colores = [
      Colors.amber, 
      Colors.black, 
      Colors.grey, 
      Colors.green, 
      Colors.cyan, 
      Colors.amber,
      Colors.yellow, 
      Color.fromRGBO(1, 1, 1,1),
      Color.fromRGBO(34, 56, 1,1),
      Color.fromRGBO(1, 110, 190,1),
    ];

    final sizeCustom = MediaQuery.of(context).size;

    return SafeArea(
      child: ListView(
        children: [Container(
          width: sizeCustom.width,
          height: sizeCustom.height,
          color: Colors.grey[300],
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: colores.length,
            itemBuilder: (context, i){
              return _CardUser(
                color: colores[i],
              );
            }
          )        
        ),
        ]
      ),
    );      
  }

}

class _CardUser extends StatelessWidget {

  final Color color;
  const _CardUser({
    Key key, 
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size sizeCustom = MediaQuery.of(context).size;
    return Container(
      width: sizeCustom.width,
      height: sizeCustom.width * 0.20,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }
}


