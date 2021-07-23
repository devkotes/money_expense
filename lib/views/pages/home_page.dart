part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double total = 0.0;
  final _transactionBloc = TransactionBloc();

  @override
  void initState() {
    _transactionBloc.add(TransactionInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer(
        bloc: _transactionBloc,
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is TransactionSuccess) {
            final transactions =
                state.transaction.values.toList().cast<Transaction>();
            transactions.map((e) => print(e));
            return buildContent(transactions);
          }

          if (state is TransactionError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Gagal mengambil data.')));
          }

          return Container();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddItemPage()))
              .then((value) {
            setState(() {
              if (value) {
                _transactionBloc.add(TransactionInit());
              } else {
                print('tidak refresh');
              }
            });
          });
        },
        backgroundColor: blueColor,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildContent(List<Transaction> transactions) {
    final listToday = transactions
        .where((element) =>
            dailyFormat.format(element.createdAt) ==
            dailyFormat.format(DateTime.now()))
        .toList();

    final listMonth = transactions
        .where((element) =>
            monthlyFormat.format(element.createdAt) ==
            monthlyFormat.format(DateTime.now()))
        .toList();

    final expenseToday = listToday.fold<double>(
        0, (previousValue, element) => previousValue + element.amount);

    final expenseMonthly = listMonth.fold<double>(
        0, (previousValue, transaction) => previousValue + transaction.amount);

    final expenseFood = transactions
        .where((element) => element.categories == 'makanan')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseInternet = transactions
        .where((element) => element.categories == 'internet')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseEducation = transactions
        .where((element) => element.categories == 'edukasi')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseGift = transactions
        .where((element) => element.categories == 'hadiah')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);
    final expenseTransport = transactions
        .where((element) => element.categories == 'transportasi')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseShop = transactions
        .where((element) => element.categories == 'belanja')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseHome = transactions
        .where((element) => element.categories == 'alat rumah')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseSport = transactions
        .where((element) => element.categories == 'olahraga')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    final expenseEntertain = transactions
        .where((element) => element.categories == 'hiburan')
        .toList()
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount);

    return RefreshIndicator(
      onRefresh: () async {
        _transactionBloc.add(TransactionInit());
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          NumberFormat.compactCurrency(
                                  symbol: 'Rp. ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(expenseToday),
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
                          NumberFormat.compactCurrency(
                                  symbol: 'Rp. ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(expenseMonthly),
                          style: bigTitle.copyWith(color: whiteColor),
                        )
                      ],
                    ),
                  ),
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
                    children: categories
                        .map((e) => CategoryCard(
                              data: e,
                              amount: (categories.indexOf(e) == 0)
                                  ? expenseFood
                                  : (categories.indexOf(e) == 1)
                                      ? expenseInternet
                                      : (categories.indexOf(e) == 2)
                                          ? expenseEducation
                                          : (categories.indexOf(e) == 3)
                                              ? expenseGift
                                              : (categories.indexOf(e) == 4)
                                                  ? expenseTransport
                                                  : (categories.indexOf(e) == 5)
                                                      ? expenseShop
                                                      : (categories
                                                                  .indexOf(e) ==
                                                              6)
                                                          ? expenseHome
                                                          : (categories.indexOf(
                                                                      e) ==
                                                                  7)
                                                              ? expenseSport
                                                              : expenseEntertain,
                              isLast: (categories.indexOf(e) ==
                                      categories.length - 1)
                                  ? true
                                  : false,
                            ))
                        .toList()),
              ),
            ),
            (listMonth.length > 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GroupedListView<Transaction, String>(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      elements: listMonth,
                      groupBy: (Transaction trx) {
                        return convertDate(trx.createdAt);
                      },
                      groupSeparatorBuilder: (String groupByValue) => Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Text(groupByValue,
                            style: paragraphBold.copyWith(color: blackColor)),
                      ),
                      itemBuilder: (context, Transaction trx) =>
                          ItemCard(data: trx),
                      itemComparator: (item1, item2) =>
                          item1.createdAt.compareTo(item2.createdAt),
                      order: GroupedListOrder.DESC,
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            child: Lottie.asset('assets/json/empty.json')),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Belum Ada Transaksi Bulan Ini',
                          style: paragraphSemiBold.copyWith(
                              color: blackColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  convertDate(DateTime date) {
    DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    var convert = dateFormat.format(date);

    return convert;
  }
}
