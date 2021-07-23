part of 'widgets.dart';

class ItemCard extends StatelessWidget {
  final Transaction data;

  ItemCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 67,
          width: MediaQuery.of(context).size.width,
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
                  (data.categories == 'makanan')
                      ? icPizza
                      : (data.categories == 'internet')
                          ? icRss
                          : (data.categories == 'edukasi')
                              ? icBook
                              : (data.categories == 'hadiah')
                                  ? icGift
                                  : (data.categories == 'hiburan')
                                      ? icClapper
                                      : (data.categories == 'belanja')
                                          ? icShopping
                                          : (data.categories == 'alat rumah')
                                              ? icHome
                                              : (data.categories == 'olahraga')
                                                  ? icBasketBall
                                                  : icCar,
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    width: 180,
                    child: Text(
                      data.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: paragraphMedium.copyWith(color: blackColor),
                    ),
                  )
                ],
              ),
              Text(
                NumberFormat.compactCurrency(
                        symbol: 'Rp. ', decimalDigits: 0, locale: 'id-ID')
                    .format(data.amount),
                style: paragraphSemiBold.copyWith(color: blackColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
