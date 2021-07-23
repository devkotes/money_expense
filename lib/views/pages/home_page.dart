part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Halo, User!',
                style: bigTitle.copyWith(color: blackColor),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Jangan lupa catat keuanganmu setiap hari!',
                style: paragraphMedium.copyWith(color: greyColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 158,
                    height: 97,
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 10),
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pengeluaranmu\nhari ini',
                          style: paragraphSemiBold.copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp. ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(30000),
                          style: bigTitle.copyWith(color: whiteColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 158,
                    height: 97,
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 10),
                    decoration: BoxDecoration(
                        color: tealColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pengeluaranmu\nbulan ini',
                          style: paragraphSemiBold.copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp. ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(30000),
                          style: bigTitle.copyWith(color: whiteColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pengeluaran berdasarkan katergori',
                style: paragraphBold.copyWith(color: blackColor),
              ),
            ),
            Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: byCategories
                        .map((e) => CategoryCard(
                              data: e,
                              isLast: (byCategories.indexOf(e) ==
                                      byCategories.length - 1)
                                  ? true
                                  : false,
                            ))
                        .toList()),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Hari Ini',
                    style: paragraphBold.copyWith(color: blackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ItemCard(
                        id: 1,
                        name: 'Ayam Geprek',
                        categories: 'makanan',
                        price: 15000,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ItemCard(
                        id: 2,
                        name: 'Gojek',
                        categories: 'tranportasi',
                        price: 15000,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Kemarin',
                    style: paragraphBold.copyWith(color: blackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ItemCard(
                        id: 1,
                        name: 'Ayam Geprek',
                        categories: 'makanan',
                        price: 15000,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ItemCard(
                        id: 2,
                        name: 'Gojek',
                        categories: 'transportasi',
                        price: 15000,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddItemPage()));
        },
        backgroundColor: blueColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
