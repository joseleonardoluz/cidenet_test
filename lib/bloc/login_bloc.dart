
import 'dart:async';

class LoginBloc{

  final _firstNameCtrl              = StreamController<String>.broadcast();
  final _secondNameCtrl             = StreamController<String>.broadcast();
  final _surNameCtrl                = StreamController<String>.broadcast();
  final _secondSurnameCtrl          = StreamController<String>.broadcast();
  final _cityJobCtrl                = StreamController<String>.broadcast();
  final _typeIdCtrl                 = StreamController<String>.broadcast();
  final _numeberIdentificationCtrl  = StreamController<String>.broadcast();
  final _emailCtrl                  = StreamController<String>.broadcast();
  final _dateAdmissionCtrl          = StreamController<String>.broadcast();
  final _areaCtrl                   = StreamController<String>.broadcast();
  final _stateCtrl                  = StreamController<String>.broadcast();
  final _dateRecordCtrl             = StreamController<String>.broadcast();


  Stream<String> get firstName => _firstNameCtrl.stream;
  Stream<String> get secondName => _secondNameCtrl.stream;
  Stream<String> get surName => _surNameCtrl.stream;
  Stream<String> get secondSurname => _secondSurnameCtrl.stream;
  Stream<String> get cityJob => _cityJobCtrl.stream;
  Stream<String> get typeId => _typeIdCtrl.stream;
  Stream<String> get numeberIdentification => _numeberIdentificationCtrl.stream;
  Stream<String> get email => _emailCtrl.stream;
  Stream<String> get dateAdmission => _dateAdmissionCtrl.stream;
  Stream<String> get area =>  _areaCtrl.stream;
  Stream<String> get state => _stateCtrl.stream;
  Stream<String> get dateRecord => _dateRecordCtrl.stream;

  Function(String) get changeFirstName => _firstNameCtrl.sink.add;
  Function(String) get changeSecondName => _secondNameCtrl.sink.add;
  Function(String) get changeSurName => _surNameCtrl.sink.add;
  Function(String) get changeSecondSurname => _secondSurnameCtrl.sink.add;
  Function(String) get changeCityJob => _cityJobCtrl.sink.add;
  Function(String) get changeTypeId => _typeIdCtrl.sink.add;
  Function(String) get changeNumeberIdentification  => _numeberIdentificationCtrl.sink.add;
  Function(String) get changeEmail => _emailCtrl.sink.add;
  Function(String) get changeDateAdmission => _dateAdmissionCtrl.sink.add;
  Function(String) get changeArea => _areaCtrl.sink.add;
  Function(String) get changeState => _stateCtrl.sink.add;
  Function(String) get changeDateRecord  => _dateRecordCtrl.sink.add;
   

  @override
  void dispose() { 
    
_firstNameCtrl.close();            
_secondNameCtrl.close();           
_surNameCtrl.close();              
_secondSurnameCtrl.close();      
_cityJobCtrl.close();             
_typeIdCtrl.close();            
_numeberIdentificationCtrl.close();
_emailCtrl.close();             
_dateAdmissionCtrl.close();      
_areaCtrl.close();             
_stateCtrl.close();              
_dateRecordCtrl.close();           
  }
}