import 'package:cidenet_test/bloc/login_bloc.dart';
import 'package:cidenet_test/bloc/provider.dart';
import 'package:cidenet_test/helper/formatter_tiem.dart';
import 'package:cidenet_test/pages/edit_user_page.dart';
import 'package:flutter/material.dart';

enum typeDate { onlyData, Complete }
class LoginPage extends StatefulWidget {

   LoginPage({
      Key key 
    }):super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  
  TextEditingController _firstNameCtrl = TextEditingController();
  TextEditingController _secondNameCtrl = TextEditingController();
  TextEditingController _surNameCtrl = TextEditingController();
  TextEditingController _secondSurnameCtrl = TextEditingController();
  TextEditingController _cityJobCtrl = TextEditingController();
  TextEditingController _typeIdCtrl = TextEditingController();
  TextEditingController _numeberIdentificationCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _areaCtrl = TextEditingController();
  TextEditingController _stateCtrl = TextEditingController();
  TextEditingController _ctrlDate = TextEditingController();
  TextEditingController _ctrlTime = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final bloc  = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          child: SingleChildScrollView(
             child: Form(
              key: _formKey, 
              child: Column(
                children: [
                CustomInput(bloc: bloc.surName, labelText: 'Primer apellido', textController: _surNameCtrl),
                CustomInput(bloc: bloc.secondSurname, labelText: 'Segundo apellido', textController: _secondSurnameCtrl),
                CustomInput(bloc: bloc.firstName, labelText: 'Primer Nombre', textController: _firstNameCtrl),
                CustomInput(bloc: bloc.secondName, labelText: 'Otros Nombres', textController: _secondNameCtrl),
                CustomInput(bloc: bloc.cityJob, labelText: 'País de empleo', textController: _cityJobCtrl),
                CustomInput(bloc: bloc.typeId, labelText: 'Tipo de Identificación', textController: _typeIdCtrl),
                CustomInput(bloc: bloc.numeberIdentification,labelText: 'Número de Identificación', textController: _numeberIdentificationCtrl),
                CustomInput(bloc: bloc.email,labelText: 'Correo electrónico', textController: _emailCtrl),
                CreateDateFile(
                  bloc: bloc.dateAdmission,
                  text: 'Fecha de ingreso', 
                  textEditingController: _ctrlDate, 
                  type: typeDate.onlyData),
                CustomInput(bloc: bloc.area, labelText: 'Área', textController: _areaCtrl),
                CustomInput(bloc: bloc.state, labelText: 'Estado', textController: _stateCtrl),
                CreateDateFile(
                  bloc: bloc.dateRecord,
                  text: 'Fecha y hora de registro', 
                  textEditingController: _ctrlTime, 
                  type: typeDate.Complete),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                  onPressed: () {
                
                   if (_formKey.currentState.validate()) {                
                      ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                 ),
                       )
                ],
              ),
            )
          ),
        )
      )
    );          
  }
}

class CreateDateFile extends StatefulWidget {

  final String text;
  final TextEditingController textEditingController;
  final typeDate type;
  final Stream<dynamic> bloc;
  
  CreateDateFile({
    Key key, 
    this.text, 
    this.textEditingController, 
    this.type, 
    @required this.bloc
  }) : super(key: key);

  @override
  _CreateDateFileState createState() => _CreateDateFileState();
}

class _CreateDateFileState extends State<CreateDateFile> {
  String _fecha = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: widget.textEditingController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: widget.text,
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context, widget.type);
        },
      ),
    );
  }

   _selectDate(BuildContext context, typeDate type) async {

    FormatterTime formatterTime = FormatterTime();
    DateTime _firstDate;

    if (type == typeDate.Complete) {
      _firstDate = DateTime(2020);
    }else{
     _firstDate = DateTime.now();
    }

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: _firstDate,
        lastDate: DateTime.now());
    String _dateFormated;
    if (type == typeDate.Complete) {
      _dateFormated = formatterTime.timeFormat(picked);
      if (picked != null) {
        setState(() {
          _fecha = _dateFormated;
          widget.textEditingController.text = _fecha;
        });
      }
    } else {
      _dateFormated = formatterTime.dateFormat(picked);
      if (picked != null) {
        setState(() {
          _fecha = _dateFormated;
          widget.textEditingController.text = _fecha;
        });
      }
    }
  }
}