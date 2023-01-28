import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/core/router.dart';

import '../../core/constants/constants.dart';
import '../../core/reusable_widgets.dart';
import '../provider.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({
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
                top: 20,
              ),
              child: ReusableWidget.screenBody(
                context,
                header: AppText.fitBoxing,
                card: ReusableWidget.infoCard(context),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 38,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableWidget.appButton(context,
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: MediaQuery.of(context).size.height / 17,
                    buttonColor: Colors.white,
                    textColor: Colors.black,
                    buttonName: AppText.back, route: () {
                  context.pop();
                }),
                SizedBox(
                  width: 10,
                ),
                ReusableWidget.appButton(context,
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: MediaQuery.of(context).size.height / 17,
                    buttonColor: Colors.black,
                    textColor: Colors.white,
                    buttonName: AppText.addCalendar, route: () {
                  context.pushReplacement(Routes.saved);
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
