import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/provider.dart';
import 'package:riverpod_test/core/constants/constants.dart';
import 'package:riverpod_test/core/reusable_widgets.dart';
import 'package:riverpod_test/core/router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dataNotifierProvider);
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
                header: AppText.name,
                importantInfo: AppText.importantInfo,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 38,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ReusableWidget.appButton(context,
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 17,
                buttonColor: Colors.black,
                textColor: Colors.white,
                buttonName: AppText.booking, route: () {
              context.push(Routes.about);
            }),
          ),
        ),
      ],
    );
  }
}
