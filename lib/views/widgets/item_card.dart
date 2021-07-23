part of 'widgets.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String categories;
  final int price;

  ItemCard({this.id, this.name, this.categories, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 67,
      width: MediaQuery.of(context).size.width - (2 * 20),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (categories == 'makanan') ? icPizza : icBasketBall,
              SizedBox(
                width: 14,
              ),
              Text(
                name,
                style: paragraphMedium.copyWith(color: blackColor),
              )
            ],
          ),
          Text(
            NumberFormat.currency(
                    symbol: 'Rp. ', decimalDigits: 0, locale: 'id-ID')
                .format(price),
            style: paragraphSemiBold.copyWith(color: blackColor),
          )
        ],
      ),
    );
  }
}
