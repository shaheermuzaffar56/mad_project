import 'package:flutter/material.dart';

// ANIMATION 1: AnimatedCrossFade
// Smoothly fades between the login screen and the menu screen.
class LoginMenuCrossFade extends StatelessWidget {
  final bool isLoggedIn;
  final Widget loginScreen;
  final Widget menuScreen;

  const LoginMenuCrossFade({
    super.key,
    required this.isLoggedIn,
    required this.loginScreen,
    required this.menuScreen,
  });

  @override
  Widget build(BuildContext context) {
    // Both screens are given the full size of the phone screen.
    final screenSize = MediaQuery.of(context).size;

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 1500),
      crossFadeState: isLoggedIn
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeOut,
      firstChild: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: loginScreen,
      ),
      secondChild: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: menuScreen,
      ),
    );
  }
}
