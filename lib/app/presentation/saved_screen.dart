import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/constants/constants.dart';
import '../../core/reusable_widgets.dart';
import '../provider.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dataNotifierProvider.notifier).state;
    final provider = ref.watch(dataNotifierProvider.notifier);
    final List<Image> pic = List.generate(
      state.data!.length,
          (index) => Image.network(
        state.data![index].fileName!,
        scale: 2,
        fit: BoxFit.fill,
        // height: MediaQuery.of(context).size.height / 4,
        filterQuality: FilterQuality.high,
      ),
    );
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            ReusableWidget.imageSlider(context, state, pic, provider),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 10,
              ),
              child: ReusableWidget.screenBody(
                context,
                header: AppText.fitBoxing,
                importantInfo: AppText.importantInfo,
                card: ReusableWidget.infoCard(context),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 50,
          child: Text(
            'Saved',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Positioned(
            bottom: 38,
            right: 10,
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.close,
                ))),
      ],
    );
  }


}
