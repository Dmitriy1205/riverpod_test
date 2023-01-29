import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    final provider = ref.watch(dataNotifierProvider.notifier);
    final data = ref.watch(dataProvider);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            data.when(
              data: (items) {
                final List<Image> pic = List.generate(
                  items.length,
                      (index) =>
                      Image.network(
                        items[index].fileName!,
                        scale: 2,
                        fit: BoxFit.fill,
                        // height: MediaQuery.of(context).size.height / 4,
                        filterQuality: FilterQuality.high,
                      ),
                );
                return Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.6,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: CarouselSlider(
                        items: pic,
                        options: CarouselOptions(
                            aspectRatio: 1,
                            scrollDirection: Axis.horizontal,
                            scrollPhysics: const ClampingScrollPhysics(),
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            onScrolled: (item) {
                              double validPosition(double position) {
                                if (position >= items.length) return 0;
                                if (position < 0) {
                                  return items.length - 1.0;
                                }
                                return position;
                              }

                              updatePosition(double position) {
                                provider.getPosition(position);

                                validPosition(provider.state.currentPosition!);
                              }

                              updatePosition(item!);
                            }),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      // top: 40,
                      child: DotsIndicator(
                        axis: Axis.horizontal,
                        dotsCount: items.isEmpty ? 1 : items.length,
                        position: provider.state.currentPosition!,
                        decorator: const DotsDecorator(
                            spacing: EdgeInsets.all(2),
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.white)),
                            size: Size(13, 11),
                            activeSize: Size(13, 11),
                            color: Colors.transparent,
                            activeColor: Colors.white),
                      ),
                    ),
                  ],
                );
              },
              error: (err, s) => SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height / 2.6,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,child: Text(err.toString()),),
              loading: () =>
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2.6,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ),
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
