import 'package:cidenet_test/helper/formatter_tiem.dart';
import 'package:cidenet_test/models/user.dart';
import 'package:flutter/material.dart';

enum typeDate { onlyData, Complete }

class EditUserPage extends StatefulWidget {
  EditUserPage({
    Key key,
  }) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  String _fecha = '';
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

     final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    _firstNameCtrl.text = user.firstName;
    _secondNameCtrl.text = user.secondName;
    _surNameCtrl.text = user.surName;
    _secondSurnameCtrl.text = user.secondSurname;
    _numeberIdentificationCtrl.text = user.numeberIdentification;
    _cityJobCtrl.text = user.cityJob;
    _typeIdCtrl.text = user.typeId;
    _emailCtrl.text = user.email;
    _areaCtrl.text = user.area;
    _stateCtrl.text = user.state;
    _ctrlDate.text = user.dateAdmission.toString();
    _ctrlTime.text = user.dateRecord.toString();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInput(labelText: 'Primer apellido', textController: _surNameCtrl),
                CustomInput(labelText: 'Segundo apellido', textController: _secondSurnameCtrl),
                CustomInput(labelText: 'Primer Nombre', textController: _firstNameCtrl),
                CustomInput(labelText: 'Otros Nombres', textController: _secondNameCtrl),
                CustomInput(labelText: 'País de empleo', textController: _cityJobCtrl),
                CustomInput(labelText: 'Tipo de Identificación', textController: _typeIdCtrl),
                CustomInput(labelText: 'Número de Identificación', textController: _numeberIdentificationCtrl),
                CustomInput(labelText: 'Correo electrónico', textController: _emailCtrl),
                _createDate('Fecha de ingreso', _ctrlDate, typeDate.onlyData),
                CustomInput(labelText: 'Área', textController: _areaCtrl),
                CustomInput(labelText: 'Estado', textController: _stateCtrl),
                _createDate('Fecha y hora de registro', _ctrlTime, typeDate.Complete),
                       Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
                       )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _createDate(String text, TextEditingController ctl, typeDate type) {

    FormatterTime formatterTime = FormatterTime();
    bool _enable;
    if (type == typeDate.Complete) {
      _enable = false;
    }else{
      _enable = true;
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        enabled: _enable,
        controller: ctl,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: text,
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context, formatterTime, type);
        },
      ),
    );
  }

  _selectDate(BuildContext context, FormatterTime formatterTime, typeDate type) async {

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
          _ctrlTime.text = _fecha;
        });
      }
    } else {
      _dateFormated = formatterTime.dateFormat(picked);
      if (picked != null) {
        setState(() {
          _fecha = _dateFormated;
          _ctrlDate.text = _fecha;
        });
      }
    }
  }
}

class CustomInput extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    Key key,
    @required this.labelText,
    @required this.textController,
    this.keyboardType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 9),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[800]))),
        child: TextFormField(
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'Por favor complete el campo';
            }
            return null;
          },
          controller: this.textController,
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14),
          keyboardType: this.keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: this.labelText,
              labelStyle: TextStyle(
                  color: Colors.black, decoration: TextDecoration.none)),
        ));
  }
}
