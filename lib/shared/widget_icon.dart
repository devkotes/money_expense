import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_expense/shared/theme.dart';

Widget icPizza = SizedBox(
  height: 24,
  width: 24,
  child: Image.asset(
    'assets/ic_pizza.png',
    color: yellowColor,
  ),
);

Widget icCar = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_car.png',
      color: purpleColor,
    ),
  ),
);

Widget icRss = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_rss.png',
      color: blueSkyColor,
    ),
  ),
);

Widget icBook = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_book.png',
      color: orangeColor,
    ),
  ),
);

Widget icGift = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_gift.png',
      color: redColor,
    ),
  ),
);

Widget icShopping = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_shopping.png',
      color: greenColor,
    ),
  ),
);

Widget icHome = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_home.png',
      color: secondPurpleColor,
    ),
  ),
);

Widget icBasketBall = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_basketball.png',
      color: secondPurpleColor,
    ),
  ),
);

Widget icClapper = Center(
  child: SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      'assets/ic_clapper.png',
      color: secondPurpleColor,
    ),
  ),
);

convertDate(DateTime date) {
  DateFormat dateFormat = DateFormat('dd MMMM yyyy');
  var convert = dateFormat.format(date);

  return convert;
}
