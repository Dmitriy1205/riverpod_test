import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/data_entity.dart';
import 'data/data_notifier.dart';

final dataNotifierProvider =
    StateNotifierProvider<DataNotifier, DataEntity>((ref) {
  return DataNotifier();
});
