// import 'package:camera/camera.dart';

import 'package:creadlymobile/View/Auth/verification.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/userdataprovider.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email = '';
  String phonenumber = '';
  String firstname = '';
  String lastname = '';
  String companyinput = '';
  String bvn = '';
  DateTime dateofbirth = DateTime.now();
  String address = '';

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 35, 25),
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
                    design.title('Info'),
                  ],
                ),
                design.hspacer(20),
                Row(
                  children: [
                    Container(
                      width: 109,
                      height: 109,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          gradient: const LinearGradient(
                              colors: [Color(0xffB5179E), Color(0xff3A0CA3)])),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.asset(
                            'assets/man.png',
                            fit: BoxFit.fill,
                            width: 109,
                            height: 109,
                          )),
                    ),
                    design.wspacer(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<UserDataProvider>(
                            builder: (context, data, child) {
                          return Text(
                            'Hello ${data.firstName}',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: design.productblack),
                          );
                        }),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: design.shadeP.withOpacity(0.2)),
                          child: Row(
                            children: [
                              Text(
                                'Upload Photo',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    color: design.ash),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                design.hspacer(10),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      design.smalltext('Email Address'),
                      Container(
                        width: width,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        height: 51,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                            color: Color(0xffC0BACE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Consumer<UserDataProvider>(
                            builder: (context, data, child) {
                          return Text(
                            ' ${data.email}',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: design.productblack),
                          );
                        }),
                      ),
                      design.smalltext('Phone Number'),
                      Container(
                        width: width,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        height: 51,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                            color: Color(0xffC0BACE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Consumer<UserDataProvider>(
                            builder: (context, data, child) {
                          return Text(
                            data.phoneNumber,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: design.productblack),
                          );
                        }),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          design.smalltext('First Name'),
                          design.wspacer(10),
                          Text(
                            'as seen on your ID*',
                            style: TextStyle(
                                color: design.pink,
                                fontSize: 7,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 51,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffC0BACE), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            initialValue: '',
                            onChanged: (input) {
                              setState(() {
                                firstname = input;
                              });
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Email address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              // errorText: validmail(email),
                            ),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          design.smalltext('Last Name'),
                          design.wspacer(10),
                          Text(
                            'as seen on your ID*',
                            style: TextStyle(
                                color: design.pink,
                                fontSize: 7,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 51,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffC0BACE), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            initialValue: '',
                            onChanged: (input) {
                              setState(() {
                                lastname = input;
                              });
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Email address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              // errorText: validmail(email),
                            ),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          design.smalltext('Input company code'),
                          design.wspacer(10),
                          Text(
                            'optional',
                            style: TextStyle(
                                color: design.numb,
                                fontStyle: FontStyle.italic,
                                fontSize: 7,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 51,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffC0BACE), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            initialValue: '',
                            onChanged: (input) {
                              setState(() {
                                companyinput = input;
                              });
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Email address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              // errorText: validmail(email),
                            ),
                          )),
                      design.smalltext('BVN'),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 51,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffC0BACE), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            initialValue: '',
                            onChanged: (input) {
                              setState(() {
                                bvn = input;
                              });
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Email address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              // errorText: validmail(email),
                            ),
                          )),
                      design.smalltext('Date Of Birth'),
                      GestureDetector(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: dateofbirth,
                              firstDate: DateTime(1960),
                              lastDate: dateofbirth);
                          if (date != null) {
                            setState(() {
                              dateofbirth = date;
                            });
                          }
                        },
                        child: Container(
                            width: width,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            height: 51,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffC0BACE), width: 1.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Text(
                                '${dateofbirth.year.toString()}-${dateofbirth.month.toString()}-${dateofbirth.day.toString()}')),
                      ),
                      design.smalltext('Address'),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 51,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffC0BACE), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            initialValue: '',
                            onChanged: (input) {
                              setState(() {
                                address = input;
                              });
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Email address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              // errorText: validmail(email),
                            ),
                          )),
                    ],
                  ),
                ),
                Center(
                  child: Consumer<UserDataProvider>(
                      builder: (context, data, child) {
                    return Visibility(
                      visible: data.loadingProgress,
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 3,
                            // value: 0.5,
                            color: Colors.white,
                            backgroundColor: design.blue),
                      ),
                    );
                  }),
                ),
                GestureDetector(
                    onTap: () async {
                      Provider.of<UserDataProvider>(context, listen: false)
                          .updateLoadingProgress(false);

                      Map body = {
                        "firstName": firstname,
                        "lastName": lastname,
                        "companyCode": companyinput,
                        "bvn": bvn,
                        "dateOfBirth":
                            '${dateofbirth.day.toString()}-${dateofbirth.month.toString()}-${dateofbirth.year.toString()}',
                        "address": address
                      };
                      Provider.of<UserDataProvider>(context, listen: false)
                          .updateDate(body)
                          .whenComplete(() => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Verificationpage(),
                                ),
                              ));
                    },
                    child: design.longButton(width, 'Update')),
              ],
            ),
          ),
        ));
  }
}
