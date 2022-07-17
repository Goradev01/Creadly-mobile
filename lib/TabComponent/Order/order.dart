import 'package:creadlymobile/TabComponent/Order/orderprocess.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

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
  List<Orderdata> orderdata = [
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Completed Transaction',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Pending Transaction',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Completed Transaction',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Pending Transaction',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00'),
    Orderdata(
        id: '#1VKDH73849',
        date: '22, May 2022',
        status: 'Completed Transaction',
        item: 'Macbook (2x), Canon Camera (4x), Oculux VR googles (2x)',
        amount: '200,000.00')
  ];
  @override
  Widget build(BuildContext context) {
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
                'Order',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: design.blue),
              ),
            ),
            design.hspacer(35),
            GestureDetector(
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const Searchproduct();
                // }));
              },
              child: Container(
                  width: width,
                  height: 40,
                  padding: const EdgeInsets.only(right: 15.3),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    design.smallText('Search'),
                    design.hspacer(12),
                    const Icon(Icons.search, size: 10, color: Color(0xff8E8E8E))
                  ])),
            ),
            design.hspacer(15),
            Row(
              children: [
                Container(
                    width: (width - 50) / 3,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xffffffff)),
                    child: design.smallineartext('All', 11)),
                Container(
                    width: (width - 50) / 3,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xfff8f8fa)),
                    child: design.input(
                        design.numb, 11, 'Pending', FontWeight.w500)),
                Container(
                    width: (width - 50) / 3,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xfff8f8fa)),
                    child: design.input(
                        design.numb, 11, 'Completed', FontWeight.w500)),
              ],
            ),
            Column(
              children: List.generate(
                  orderdata.length,
                  (index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const OrderProcess();
                                }));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      design.smallText(orderdata[index].date),
                                      design.hspacer(5),
                                      design.title(orderdata[index].id),
                                      design.hspacer(10),
                                      design.smalltext('items'),
                                      design.hspacer(10),
                                      SizedBox(
                                        width: 125,
                                        child: design.input(
                                            const Color(0xff8e8e8e),
                                            10,
                                            orderdata[index].item,
                                            FontWeight.w500),
                                      ),
                                      design.hspacer(10),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              14, 4, 14, 5),
                                          decoration: BoxDecoration(
                                              color: orderdata[index].status ==
                                                      'Completed Transaction'
                                                  ? const Color(0xff00BA07)
                                                      .withOpacity(0.2)
                                                  : const Color(0xffD3AE28)
                                                      .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(29)),
                                          child: Text(
                                            orderdata[index].amount,
                                            style: TextStyle(
                                                color: orderdata[index]
                                                            .status ==
                                                        'Completed Transaction'
                                                    ? const Color(0xff00BA07)
                                                    : const Color(0xffD3AE28),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      design.hspacer(25),
                                      design.amount(
                                          design.blue,
                                          20.0,
                                          orderdata[index].amount,
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
            )
          ],
        ),
      ),
    ));
  }
}
