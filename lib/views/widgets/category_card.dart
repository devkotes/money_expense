part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isLast;

  CategoryCard({this.data, this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: isLast ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  spreadRadius: 4,
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(data['color'])),
                child: Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      data['icon'],
                    ),
                  ),
                )),
            SizedBox(
              height: 12,
            ),
            Text(
              data['title'],
              style: captionMedium.copyWith(color: greyColor),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              NumberFormat.currency(
                      symbol: 'Rp. ', decimalDigits: 0, locale: 'id-ID')
                  .format(data['total']),
              style: captionBold.copyWith(color: blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
