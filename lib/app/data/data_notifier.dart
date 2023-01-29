import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/data/data_repository.dart';

import '../../core/constants/constants.dart';
import 'data_entity.dart';

class DataNotifier extends StateNotifier<DataEntity> {
  DataNotifier() : super(DataEntity(status: Status.initial));

  DataRepository repo = DataRepository();

  void getPosition(double position) =>
      state = state.copyWith(currentPosition: position);
}
