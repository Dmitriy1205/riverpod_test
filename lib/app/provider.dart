import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/data/data_repository.dart';
import 'package:riverpod_test/app/model/data_model.dart';

import 'data/data_entity.dart';
import 'data/data_notifier.dart';

DataRepository repo = DataRepository();
final dataNotifierProvider =
    StateNotifierProvider<DataNotifier, DataEntity>((ref) {
  return DataNotifier();
});
final dataProvider = FutureProvider<List<DataModel>>(
  (ref) async => await repo.fetchData(),
);
