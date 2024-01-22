import 'package:equatable/equatable.dart';

class Convert extends Equatable {
  final String? from;
  final double? price;
  final int? timestamp;
  final String? to;
  final double? total;

  const Convert({
    this.from,
    this.price,
    this.timestamp,
    this.to,
    this.total,
  });

  factory Convert.fromJson(Map<String, dynamic> json) => Convert(
        from: json['from'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        timestamp: json['timestamp'] as int?,
        to: json['to'] as String?,
        total: (json['total'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'price': price,
        'timestamp': timestamp,
        'to': to,
        'total': total,
      };

  Convert copyWith({
    String? from,
    double? price,
    int? timestamp,
    String? to,
    double? total,
  }) {
    return Convert(
      from: from ?? this.from,
      price: price ?? this.price,
      timestamp: timestamp ?? this.timestamp,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [from, price, timestamp, to, total];
}
