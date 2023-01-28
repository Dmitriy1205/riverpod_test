import 'package:equatable/equatable.dart';
import 'package:riverpod_test/app/model/data_model.dart';

import '../../core/constants/constants.dart';

class DataEntity extends Equatable {
  final Status? status;
  final List<DataModel>? data;
  final double? currentPosition;

  DataEntity({
    this.status,
    this.data,
    this.currentPosition = 0.0,
  });

  DataEntity copyWith({
    final Status? status,
    final List<DataModel>? data,
    double? currentPosition,
  }) {
    return DataEntity(
      status: status ?? this.status,
      data: data ?? this.data,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }

  @override
  List<Object?> get props =>
      [
        status,
        data,
        currentPosition,
      ];
}
