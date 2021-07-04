import 'package:cidenet_test/helper/formatter_tiem.dart';
import 'package:flutter/material.dart';

enum TypeDate { onlyData, Complete }

class CustomFieldData extends StatefulWidget {

  final String text;
  final TextEditingController textEditingController;
  final TypeDate type;
  final Stream<dynamic> bloc;
  
  CustomFieldData({
    Key key, 
    this.text, 
    this.textEditingController, 
    this.type, 
    @required this.bloc
  }) : super(key: key);

  @override
  _CustomFieldDataState createState() => _CustomFieldDataState();
}

class _CustomFieldDataState extends State<CustomFieldData> {
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

   _selectDate(BuildContext context, TypeDate type) async {

    FormatterTime formatterTime = FormatterTime();
    DateTime _firstDate;

    if (type == TypeDate.Complete) {
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
    if (type == TypeDate.Complete) {
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