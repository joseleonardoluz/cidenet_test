import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User extends Equatable{

  final String firstName;
  final String secondName;
  final String surName;
  final String secondSurname;
  final String cityJob;
  final String typeId;
  final String numeberIdentification;
  final String email;
  final DateTime dateAdmission;
  final String area;
  final String state;
  final DateTime dateRecord;

  User({
    @required this.firstName, 
    @required this.secondName, 
    @required this.surName, 
    @required this.secondSurname, 
    @required this.cityJob, 
    @required this.typeId, 
    @required this.numeberIdentification, 
    @required this.email, 
    @required this.dateAdmission, 
    @required this.area, 
    @required this.state, 
    @required this.dateRecord
  });


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}