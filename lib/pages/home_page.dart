import 'package:cidenet_test/helper/formatter_tiem.dart';
import 'package:cidenet_test/models/user.dart';
import 'package:cidenet_test/pages/edit_user_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

 HomePage({
    Key key 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    User user = User(
       firstName: 'Jose',
       secondName: 'Leonardo',
       surName: 'Luz',
       secondSurname: 'Toloza',
       cityJob: 'Bog',
       typeId: 'CC',
       numeberIdentification: '10262626',
       email: 'jlluz@gmail.com.co',
       dateAdmission: DateTime.now(),
       area: 'IT',
       state: 'Activo',
       dateRecord: DateTime.now()
    );

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
              Icons.add_box
            ),
             onPressed: (){
                Navigator.of(context).pushNamed('loginPage');
             }
            ),
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
                    _ItemUser(
                       user: user,
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

class _ItemUser extends StatelessWidget {

  final User user;

  _ItemUser({
    Key key, 
    @required this.user, 
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
                  user.firstName+ ' '+ user.secondName,                 
                  style: styleCustom
                ),
                Text(
                  user.surName +' '+user.secondSurname,
                  style: styleCustom
                ),
                SizedBox(height: 10),
                Text(
                  user.cityJob,
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
                  user.email,
                  style: styleCustom
                ),
                SizedBox(height: 15),
                Text(
                  user.state,
                  style: styleCustom
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                   Navigator.pushNamed(context, 'editUserPage', arguments: user);
                },
                child: Icon(Icons.edit, color: Colors.blue)
              ),
              InkWell(
                onTap: (){
                  
                },
                child: Icon(Icons.delete_forever_outlined, color: Colors.red)
              ),
            ],
          )
        ],
      ),
    );
  }
}


