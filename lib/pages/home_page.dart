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
      child: Scaffold(
        appBar: AppBar(
          title: Text('Usuarios'),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(icon: Icon(
              Icons.search
            ),
             onPressed: (){

             }
            )
          ],
        ),
        body: ListView(
          children: [Container(
            width: sizeCustom.width,
            height: sizeCustom.height,
            color: Colors.grey[300],
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: colores.length,
              itemBuilder: (context, i){
                return Column(
                  children: [
                    _CardUser(
                      name: 'Jose Leonardo',
                      lastName: 'Luz Toloza',
                      city: 'Colombia',
                      email: 'josel.luzt@gmail.com',
                      state: 'Activo',
                      color: colores[i],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.indigo,
                    )
                  ],
                );
              }
            )        
          ),
          ]
        ),
      ),
    );      
  }

}

class _CardUser extends StatelessWidget {

  final Color color;
  final String name;
  final String lastName;
  final String city;
  final String email;
  final String state;

  _CardUser({
    Key key, 
    @required this.color, 
    @required this.name, 
    @required this.lastName, 
    @required this.city,
    @required this.email, 
    @required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size sizeCustom = MediaQuery.of(context).size;
   TextStyle styleCustom = TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16);
    return Container(  
      margin: EdgeInsets.symmetric(horizontal: 10),    
      width: sizeCustom.width,
      height: sizeCustom.width * 0.20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,        
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,                    
                  style: styleCustom
                ),
                SizedBox(height: 7),
                Text(
                  lastName,
                  style: styleCustom
                ),
                SizedBox(height: 10),
                Text(
                  city,
                  style: styleCustom
                )
              ],
            ),
          ),
          SizedBox(
            
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: styleCustom
                ),
                SizedBox(height: 15),
                Text(
                  state,
                  style: styleCustom
                )
              ],
            ),
          ),
          Icon(Icons.menu)
        ],
      ),
    );
  }
}


