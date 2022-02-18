import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final String id;
  final String code;
  final double value;

  const Voucher({required this.id, required this.code, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'value': value,
    };
  }

  Voucher copyWith({
    String? id,
    String? code,
    double? value,
  }) {
    return Voucher(
        id: id ?? this.id, code: code ?? this.code, value: value ?? this.value);
  }

  factory Voucher.fromSnapshot(DocumentSnapshot snap) {
    return Voucher(
      id: snap['id'], 
      code: snap['code'], 
      value: double.parse(snap['value'].toString()),
      );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, code, value];

  static List<Voucher> vouchers = [
    const Voucher(id: '1', code: 'SAVES', value: 5.0),
    const Voucher(id: '2', code: 'SAVES10', value: 10.0),
    const Voucher(id: '3', code: 'SAVES15', value: 15.0),
  ];
}
