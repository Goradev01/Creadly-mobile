import 'package:creadlymobile/Model/Core/orderdata.dart';
import 'package:creadlymobile/Provider/orderprovider.dart';
import 'package:creadlymobile/View/TabComponent/Order/orderprocess.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({Key? key}) : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class Orderdata {
  final String id;
  final String status;
  final String item;
  final String date;
  final String amount;
  Orderdata({
    required this.id,
    required this.status,
    required this.item,
    required this.date,
    required this.amount,
  });
}

class _OrderpageState extends State<Orderpage> {
  List<Orderdata> orderData = [
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Settled',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'In Progress',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Settled',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'In Progress',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Settled',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00')
  ];
  int tabno = 0;
  @override
  Widget build(BuildContext context) {
    Widget smalltext(text) {
      return Text(
        text,
        style: const TextStyle(
            color: Color(0xff8e8e8e),
            fontSize: 10,
            fontWeight: FontWeight.w400),
      );
    }

    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Transactions',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: design.blue),
              ),
            ),
            design.hspacer(35),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabno = 0;
                    });
                  },
                  child: Container(
                      width: (width - 50) / 2,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tabno == 0
                              ? const Color(0xffffffff)
                              : const Color(0xfff8f8fa)),
                      child: tabno != 0
                          ? design.input(
                              design.numb, 11, 'Orders', FontWeight.w500)
                          : design.smallineartext('Orders', 11)),
                ),
                GestureDetector(
                  onTap: () {
                    orderData.shuffle();
                    setState(() {
                      tabno = 1;
                    });
                  },
                  child: Container(
                      width: (width - 50) / 2,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tabno == 1
                              ? const Color(0xffffffff)
                              : const Color(0xfff8f8fa)),
                      child: tabno != 1
                          ? design.input(
                              design.numb, 11, 'Payments', FontWeight.w500)
                          : design.smallineartext('Payments', 11)),
                ),
              ],
            ),
            design.hspacer(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: (width - 60) / 2,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15.3),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8FA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smalltext('All'),
                          Transform.rotate(
                              angle: 55,
                              child: Icon(Icons.arrow_back_ios,
                                  size: 10, color: design.darkPurple))
                        ])),
                Container(
                    width: (width - 60) / 2,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15.3),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8FA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          smalltext('Search'),
                          design.wspacer(15),
                          Icon(Icons.search, size: 10, color: design.darkPurple)
                        ])),
              ],
            ),
            Consumer<OrderProvider>(builder: (context, data, child) {
              return FutureBuilder<List<OrderData>>(
                  future: data.getOrderData(),
                  builder: (context, snapshot) {
                    // print(snapshot.data![0].amountPaid);
                    if (snapshot.connectionState.name == 'done') {
                      return Column(
                        children: List.generate(
                            snapshot.data!.length,
                            (index) => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const OrderProcess();
                                          }));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                design.smallText(snapshot
                                                    .data?[index].createdAt),
                                                design.hspacer(5),
                                                Text(snapshot.data![index].id!,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    )),
                                                design.hspacer(10),
                                                design.smalltext('items'),
                                                design.hspacer(10),
                                                SizedBox(
                                                  width: 125,
                                                  child: Row(
                                                      children: List.generate(
                                                    snapshot.data![index].items!
                                                        .length,
                                                    (ind) => design.input(
                                                        const Color(0xff8e8e8e),
                                                        10,
                                                        snapshot.data![index]
                                                                    .items![ind]
                                                                ['productId']
                                                            ['name'],
                                                        FontWeight.w500),
                                                  )),
                                                ),
                                                design.hspacer(10),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                    width: 137,
                                                    height: 21,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: snapshot
                                                                .data![index]
                                                                .isCompleted!
                                                            ? design.shadeP
                                                            : design.shadePi,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(29)),
                                                    child: Text(
                                                      // orderdata[index].isid
                                                      snapshot.data![index]
                                                              .isCompleted!
                                                          ? 'Settled'
                                                          : 'In progress',
                                                      style: TextStyle(
                                                          color: snapshot
                                                                  .data![index]
                                                                  .isCompleted!
                                                              ? design.blue
                                                              : design.pink,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                                design.hspacer(25),
                                                design.amount(
                                                    design.blue,
                                                    20.0,
                                                    snapshot
                                                        .data![index].amountPaid
                                                        .toString(),
                                                    FontWeight.w500)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: design.blue,
                                        thickness: 1,
                                      )
                                    ],
                                  ),
                                )),
                      );
                    }
                    if (snapshot.connectionState.name == 'waiting') {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: design.blue,
                      ));
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: design.blue,
                      ));
                    }
                  });
            })
          ],
        ),
      ),
    ));
  }
}
