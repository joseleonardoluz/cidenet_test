import 'package:cidenet_test/bloc/login_bloc.dart';
import 'package:cidenet_test/bloc/provider.dart';
import 'package:cidenet_test/models/user.dart';
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
    final bloc  = Provider.of(context);

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
                      bloc: bloc,                    
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

  final LoginBloc bloc;

  _ItemUser({
    Key key,
    @required this.bloc, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size _sizeCustom = MediaQuery.of(context).size;   

   TextStyle styleCustom = TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16);
                  
    return StreamBuilder(
      stream: bloc.user,
      builder: (context, snapshot) {
        final User _user = snapshot.data;
        return Container(  
          margin: EdgeInsets.symmetric(horizontal: 10),    
          width: _sizeCustom.width,
          height: _sizeCustom.width * 0.20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,        
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     (_user != null || snapshot.hasData) 
                     ? _user.firstName + ' '+ _user.secondName
                     : 'Name',
                      style: styleCustom
                    ),
                    Text(
                      (_user != null || snapshot.hasData) 
                      ? _user.surName + ' '+ _user.secondSurname
                      : 'Surname',
                      style: styleCustom
                    ),
                    SizedBox(height: 10),
                    Text(
                      (_user != null || snapshot.hasData) 
                       ? _user.cityJob
                       : 'City job',
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
                      (_user != null || snapshot.hasData) 
                       ? _user.email
                       : 'Mail',
                      style: styleCustom
                    ),
                    SizedBox(height: 15),
                    Text(
                      (_user != null || snapshot.hasData) 
                       ? _user.state
                       : '',
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
                       Navigator.pushNamed(context, 'editUserPage', arguments: snapshot.data);
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
    );
  }
}


