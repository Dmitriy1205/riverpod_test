import 'package:flutter/material.dart';
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
            const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
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

}
