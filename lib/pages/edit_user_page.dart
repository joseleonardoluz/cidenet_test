
import 'package:cidenet_test/bloc/provider.dart';
import 'package:cidenet_test/helper/formatter_tiem.dart';
import 'package:cidenet_test/models/user.dart';
import 'package:cidenet_test/widgets/custom_input.dart';
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

    final bloc = Provider.of(context);

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
                StreamBuilder<Object>(
                  stream: bloc.user,
                  builder: (context, snapshot) {
                    return CustomInput(
                        
                        labelText: 'Primer apellido',
                        textController: _surNameCtrl);
                  }
                ),
                CustomInput(
                    
                    labelText: 'Segundo apellido',
                    textController: _secondSurnameCtrl),
                // CustomInput(
                    
                //     labelText: 'Primer Nombre',
                //     textController: _firstNameCtrl),
                // CustomInput(
                   
                //     labelText: 'Otros Nombres',
                //     textController: _secondNameCtrl),
                // CustomInput(
                   
                //     labelText: 'País de empleo',
                //     textController: _cityJobCtrl),
                // CustomInput(
                   
                //     labelText: 'Tipo de Identificación',
                //     textController: _typeIdCtrl),
                // CustomInput(
                   
                //     labelText: 'Número de Identificación',
                //     textController: _numeberIdentificationCtrl),
                // CustomInput(
                   
                //     labelText: 'Correo electrónico',
                //     textController: _emailCtrl),
                // _createDate('Fecha de ingreso', _ctrlDate, typeDate.onlyData,
                //     bloc.dateAdmission),
                // CustomInput(
                    
                //     labelText: 'Área',
                //     textController: _areaCtrl),
                // CustomInput(
                    
                //     labelText: 'Estado',
                //     textController: _stateCtrl),
                // _createDate('Fecha y hora de registro', _ctrlTime,
                //     typeDate.Complete, bloc.dateRecord),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
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

  Widget _createDate(String text, TextEditingController ctl, typeDate type,
      Stream<dynamic> bloc) {
    bool _enable;
    if (type == typeDate.Complete) {
      _enable = false;
    } else {
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
          _selectDate(context, type);
        },
      ),
    );
  }

  _selectDate(BuildContext context, typeDate type) async {
    FormatterTime formatterTime = FormatterTime();
    DateTime _firstDate;

    if (type == typeDate.Complete) {
      _firstDate = DateTime(2020);
    } else {
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

