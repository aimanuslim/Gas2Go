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
    Navigator.pushNamed(context, CustomerIntro.id);
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
