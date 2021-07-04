
import 'package:cidenet_test/bloc/provider.dart';
import 'package:cidenet_test/widgets/custom_input.dart';
import 'package:flutter/material.dart';

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
                CustomInput(labelText: 'Primer apellido', textController: _surNameCtrl),
                CustomInput(labelText: 'Segundo apellido', textController: _secondSurnameCtrl),
                // CustomInput(funcionBloc: bloc.changeFirstName, bloc: bloc, stream: bloc.firstName, labelText: 'Primer Nombre', textController: _firstNameCtrl),
                // CustomInput(funcionBloc: bloc.changeSecondName, bloc: bloc, stream: bloc.secondName, labelText: 'Otros Nombres', textController: _secondNameCtrl),
                // CustomInput(funcionBloc: bloc.changeCityJob, bloc: bloc, stream: bloc.cityJob, labelText: 'País de empleo', textController: _cityJobCtrl),
                // CustomInput(funcionBloc: bloc.changeTypeId, bloc: bloc, stream: bloc.typeId, labelText: 'Tipo de Identificación', textController: _typeIdCtrl),
                // CustomInput(funcionBloc: bloc.changeNumeberIdentification, bloc: bloc, stream: bloc.numeberIdentification,labelText: 'Número de Identificación', textController: _numeberIdentificationCtrl),
                // CustomInput(funcionBloc: bloc.changeEmail, bloc: bloc, stream: bloc.email,labelText: 'Correo electrónico', textController: _emailCtrl),
                // CustomFieldData(
                //   bloc: bloc.dateAdmission,
                //   text: 'Fecha de ingreso', 
                //   textEditingController: _ctrlDate, 
                //   type: TypeDate.onlyData,
                // ), 
                // CustomInput(funcionBloc: bloc.changeArea, bloc: bloc, stream: bloc.area, labelText: 'Área', textController: _areaCtrl),
                // CustomInput(funcionBloc: bloc.changeState, bloc: bloc, stream: bloc.state, labelText: 'Estado', textController: _stateCtrl),
                // CustomFieldData(
                //   bloc: bloc.dateRecord,
                //   text: 'Fecha y hora de registro', 
                //   textEditingController: _ctrlTime, 
                //   type: TypeDate.onlyData),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                  onPressed: () {
                    bloc.changeValuesUser;
                    print(_surNameCtrl.text);
                    print(_secondSurnameCtrl);
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

