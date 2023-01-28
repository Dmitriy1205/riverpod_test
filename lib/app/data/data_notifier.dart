import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/data/data_repository.dart';

import '../../core/constants/constants.dart';
import 'data_entity.dart';

class DataNotifier extends StateNotifier<DataEntity> {
  DataNotifier() : super(DataEntity(status: Status.initial)) {
    getData();
  }

  DataRepository repo = DataRepository();

  Future<void> getData() async {
    state = state.copyWith(status: Status.loading);
    try {
      final data = await repo.fetchData();

      state = state.copyWith(status: Status.loading, data: data);
    } on Exception catch (e) {
      state = state.copyWith(status: Status.error);
    }
  }

  void getPosition(double position) =>
      state = state.copyWith(currentPosition: position);
}
