part of 'pages.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = new TextEditingController();
  TextEditingController titleController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();
  TextEditingController tglController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  String sufixIcon = '';
  int colorSelected = 0;

  @override
  void initState() {
    super.initState();
    categoryController.text = 'Makanan';
    sufixIcon = 'assets/ic_pizza.png';
    colorSelected = 0xffF2C94C;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: Image.asset(
                            'assets/ic_back.png',
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Tambah Pengeluaran Baru',
                        style: bigTitle.copyWith(color: blackColor),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: titleController,
                  style: paragraphMedium.copyWith(color: blackColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 0, 16),
                    hintText: 'Nama Pengeluaran',
                    hintStyle:
                        paragraphMedium.copyWith(color: Color(0xff828282)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(width: 1, color: blueColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: categoryController,
                  onTap: () {
                    showModalCategory(context);
                  },
                  readOnly: true,
                  style: paragraphMedium.copyWith(color: blackColor),
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 14, 16),
                    prefixIcon: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          sufixIcon,
                          color: Color(colorSelected),
                        ),
                      ),
                    ),
                    isDense: true,
                    suffixIcon: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        'assets/ic_forward.png',
                      ),
                    ),
                    hintStyle:
                        paragraphMedium.copyWith(color: Color(0xff828282)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  style: paragraphMedium.copyWith(color: blackColor),
                  keyboardType: TextInputType.number,
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 14, 16),
                    hintText: 'Tanggal Pengeluaran',
                    isDense: true,
                    suffixIcon: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        'assets/ic_calendar.png',
                      ),
                    ),
                    hintStyle:
                        paragraphMedium.copyWith(color: Color(0xff828282)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: priceController,
                  style: paragraphMedium.copyWith(color: blackColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 0, 16),
                    hintText: 'Nominal',
                    hintStyle:
                        paragraphMedium.copyWith(color: Color(0xff828282)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(width: 1, color: blueColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE0E0E0))),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Simpan',
                      style: bigTitle.copyWith(color: whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showModalCategory(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        context: context,
        builder: (builder) {
          return Container(
            height: 345,
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pilih Kategori',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4F4F4F)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                Wrap(
                  runSpacing: 23,
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: categories
                      .map((e) => InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                colorSelected = e['color'];
                                sufixIcon = e['icon'];
                                categoryController.text = e['title'];
                              });
                            },
                            child: Container(
                              width: 70,
                              child: Column(
                                children: [
                                  Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(e['color'])),
                                      child: Center(
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Image.asset(
                                            e['icon'],
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(e['title'],
                                      style: captionMedium.copyWith(
                                          color: greyColor))
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          );
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    var myFormat = DateFormat('EEEE, dd MMMM yyyy');
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        dateController.text = myFormat.format(picked);
        selectedDate = picked;
        print(selectedDate.toString());
      });
  }
}
