import 'package:equatable/equatable.dart';

class DeliveryTime extends Equatable {
  final int id;
  final String value;
  final DateTime? time;

  const DeliveryTime(
      {required this.id, required this.value, required this.time});

  @override
  List<Object?> get props => [id, value, time];

  static List<DeliveryTime> deliveryTime = [
    DeliveryTime(
      id: 1,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 2,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 3,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 4,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 5,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 6,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
  ];
}
