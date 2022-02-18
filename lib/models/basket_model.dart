import 'package:equatable/equatable.dart';
import 'package:fooddelivery2/models/models.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;
  final Voucher voucher;
  final DeliveryTime deliveryTime;

  const Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
    this.voucher = const Voucher(id: '0', code: '', value: 0),
    this.deliveryTime = const DeliveryTime(id: 0, value: '', time: null)
  });

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object> get props => [items, cutlery, voucher, deliveryTime];

  Map itemQuantity(items) {
    var quantity = {};

    for (var item in items) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    }
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return (voucher.value == 0) ? subtotal + 5 : subtotal + 5 - voucher.value;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);
}
