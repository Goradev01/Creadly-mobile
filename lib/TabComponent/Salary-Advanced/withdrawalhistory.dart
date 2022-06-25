import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

import 'salary.dart';

class Withdrawalhistory extends StatefulWidget {
  const Withdrawalhistory({Key? key}) : super(key: key);

  @override
  State<Withdrawalhistory> createState() => _WithdrawalhistoryState();
}

class _WithdrawalhistoryState extends State<Withdrawalhistory> {
  List<Withdraw> withdrawinfo = [
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
  ];
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF8F8FA)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 10,
                        color: design.blue,
                      )),
                ),
                design.wspacer(19),
                design.title('Salary Advance'),
              ],
            ),
            design.hspacer(35),
            Row(
              children: [
                design.title('Previous Withdrawals'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('View all',
                      style: TextStyle(
                          fontSize: 12.0,
                          decorationColor: design.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          color: design.blue)),
                )
              ],
            ),
            Column(
              children: List.generate(
                  withdrawinfo.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 3),
                            child: Text(withdrawinfo[index].date,
                                style: TextStyle(
                                    fontSize: 7,
                                    color: design.numb,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 3.0, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    design.naira(design.darkPurple, 15.0),
                                    Text(withdrawinfo[index].amount,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: design.darkPurple,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Container(
                                  width: 136,
                                  alignment: Alignment.center,
                                  height: 24,
                                  // padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color:
                                          withdrawinfo[index].mode == 'Pending'
                                              ? const Color(0xffFFB800)
                                                  .withOpacity(0.3)
                                              : withdrawinfo[index].mode ==
                                                      'Successful'
                                                  ? const Color(0xff00BA07)
                                                      .withOpacity(0.3)
                                                  : const Color(0xffCE2E2E)
                                                      .withOpacity(0.3)),
                                  child: Text(withdrawinfo[index].mode,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: withdrawinfo[index].mode ==
                                                  'Pending'
                                              ? const Color(0xffFFB800)
                                              : withdrawinfo[index].mode ==
                                                      'Successful'
                                                  ? const Color(0xff00BA07)
                                                  : const Color(0xffCE2E2E))),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
