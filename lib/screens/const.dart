import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConstSvgIcons {
  final close = "assets/icons/Сlose.svg";
  final ball = "assets/icons/Ball.svg";
  final calendar = "assets/icons/Calendar.svg";
  final change = "assets/icons/Change.svg";
  final filter = "assets/icons/Filter.svg";
  final fire = "assets/icons/Fire.svg";

  final hotel = "assets/icons/Hotel.svg";
  final human = "assets/icons/Human.svg";
  final leftArrow = "assets/icons/LeftArrow.svg";
  final notifications = "assets/icons/Notifications.svg";
  final plus = "assets/icons/Plus.svg";
  final present = "assets/icons/Present.svg";
  final profile = "assets/icons/Profile.svg";
  final rightArrow = "assets/icons/RightArrow.svg";
  final route = "assets/icons/Route.svg";
  final samolet = "assets/icons/Samolet.svg";

  final sample = "assets/icons/Sample.svg";
  final schedule = "assets/icons/Schedule.svg";
  final search = "assets/icons/Search.svg";
  final share = "assets/icons/Share.svg";
  final short = "assets/icons/Short.svg";
  final subscriptions = "assets/icons/Subscriptions.svg";
  final tooltip = "assets/icons/Tooltip.svg";
  changeSizeAndColor(String iconPath, Color color, double sh, double sw) {
    return SvgPicture.asset(
      iconPath,
      color: color,
      width: sw,
      height: sh,
    );
  }
}

Widget semibold({
  required BuildContext context,
  required String title,
  required color,
  bool isCenter = false,
  required double fontSizeT,
}) {
  return isCenter
      ? Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: color, fontSize: fontSizeT)))
      : Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: color, fontSize: fontSizeT));
}

Widget regular({
  required BuildContext context,
  required String title,
  required color,
  bool isCenter = false,
  required double fontSizeT,
  TextAlign textAlign = TextAlign.justify,
}) {
  return isCenter
      ? Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: color, fontSize: fontSizeT)))
      : Text(title,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: color,
                fontSize: fontSizeT,
              ));
}

Widget medium({
  required BuildContext context,
  required String title,
  required color,
  bool isCenter = false,
  required double fontSizeT,
}) {
  return isCenter
      ? Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: color, fontSize: fontSizeT)))
      : Text(title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: color, fontSize: fontSizeT));
}

Widget bold({
  required BuildContext context,
  required String title,
  required color,
  bool isCenter = false,
  required double fontSizeT,
}) {
  return SliverToBoxAdapter(
      child: isCenter
          ? Center(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: color, fontSize: fontSizeT)))
          : Text(title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: color, fontSize: fontSizeT)));
}
