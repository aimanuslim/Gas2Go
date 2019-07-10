import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'intro.dart';

// Onboarding screens
class CustomerOnboarding extends StatefulWidget {
  static const String id = "customer_onboarding";
  @override
  _CustomerOnboardingState createState() => _CustomerOnboardingState();
}

class _CustomerOnboardingState extends State<CustomerOnboarding> {
  // List<Slide> slides = new List();

  // @override
  // void initState() {
  //   super.initState();

  //   slides.add(
  //     Slide(
  //       maxLineTitle: 200,
  //       widthImage: 300,
  //       heightImage: 300,
  //       title: "EZ-ly order cooking gas",
  //       description:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  //       pathImage: "assets/onboarding_1_order.png",
  //     ),
  //   );
  //   Text("Test");
  //   slides.add(
  //     Slide(
  //       maxLineTitle: 200,
  //       widthImage: 300,
  //       heightImage: 300,
  //       title: "Our suppliers will deliver the goods",
  //       description:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  //       pathImage: "assets/onboarding_2_delivery.png",
  //     ),
  //   );
  //   slides.add(
  //     Slide(
  //       maxLineTitle: 200,
  //       widthImage: 300,
  //       heightImage: 300,
  //       title: "Invite friends and earn cashbacks",
  //       description:
  //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. - (this feature is coming soon)",
  //       pathImage: "assets/onboarding_3_cashbacks.png",
  //     ),
  //   );
  // }

  // void onDonePress() {
  //   Navigator.pushNamed(context, '/customer/appEntry');
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return new IntroSlider(
  //     slides: this.slides,
  //     onDonePress: this.onDonePress,
  //   );
  // }

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "EZ-ly order cooking gas",
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        pathImage: "assets/onboarding_1_order.png",
        backgroundColor: Color(0xff323E6E),
      ),
    );
    slides.add(
      new Slide(
        title: "Our suppliers will deliver the goods",
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        pathImage: "assets/onboarding_2_delivery.png",
        backgroundColor: Color(0xff323E6E),
      ),
    );
    slides.add(
      new Slide(
        title: "Invite friends and earn cashbacks",
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. - (this feature is coming soon)",
        pathImage: "assets/onboarding_3_cashbacks.png",
        backgroundColor: Color(0xff323E6E),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, CustomerAppEntry.id);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      colorDot: Color(0xff222222),
      colorActiveDot: Color(0xffFFFFFF),
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
