import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../app/data/data_entity.dart';
import '../app/data/data_notifier.dart';
import 'constants/constants.dart';

class ReusableWidget {
  static appButton(
    BuildContext context, {
    required double width,
    required double height,
    required Color buttonColor,
    required Color textColor,
    required Function() route,
    required String buttonName,
  }) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed:
          route
        ,
        child: SizedBox(
            width: width,
            height: height,
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(fontSize: 18, color: textColor),
            ))));
  }

  static screenBody(
    BuildContext context, {
    required String header,
    String? importantInfo,
    Widget? card,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              header,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              AppText.time,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              AppText.address,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),
            card ?? const SizedBox(),
            const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
                AppText.info,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            importantInfo == null
                ? const SizedBox()
                : Text(
                    importantInfo,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: const Text(
                AppText.review,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
  static  infoCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
        top: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                child: Image.asset('assets/pic.png'),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppText.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 5,),
                  Text(AppText.boxing,style: TextStyle(fontSize: 15,color: Colors.grey),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  static imageSlider(BuildContext context, DataEntity state, List<Image> pic, DataNotifier provider) {

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [

        SizedBox(
          height: MediaQuery.of(context).size.height / 2.6,
          width: MediaQuery.of(context).size.width,
          child: state.data! == null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Colors.black,
            ),
          )
              : CarouselSlider(
            items: pic,
            options: CarouselOptions(
                aspectRatio: 1,
                scrollDirection: Axis.horizontal,
                scrollPhysics: const ClampingScrollPhysics(),
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onScrolled: (item) {
                  double validPosition(double position) {
                    if (position >= state.data!.length) return 0;
                    if (position < 0) {
                      return state.data!.length - 1.0;
                    }
                    return position;
                  }

                  updatePosition(double position) {
                    provider.getPosition(position);

                    validPosition(state.currentPosition!);
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
            dotsCount: state.data!.isEmpty ? 1 : state.data!.length,
            position: state.currentPosition!,
            decorator: const DotsDecorator(
                spacing: EdgeInsets.all(2),
                shape:
                CircleBorder(side: BorderSide(color: Colors.white)),
                size: Size(13, 11),
                activeSize: Size(13, 11),
                color: Colors.transparent,
                activeColor: Colors.white),
          ),
        ),
      ],
    );
  }
}
