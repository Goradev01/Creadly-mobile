import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Model/Core/productdata.dart';
import '../../../Provider/productprovider.dart';
import 'productdetail.dart';

class CategoryProduct extends StatefulWidget {
  final String id;
  const CategoryProduct({Key? key, required this.id}) : super(key: key);

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  void initState() {
    super.initState();
     
    //     .then((value) {
    //   data = value;
    //   print(data[0].name);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(FutureBuilder<List<ProductData>>(
        future: Provider.of<ProductProvider>(context, listen: false)
            .performCategoryQuery(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState.name == 'done') {
            // print(snapshot.data![0].name);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
                child: GridView.count(
                  // crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 10.0,
                  physics: const ScrollPhysics(),
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => GestureDetector(
                            onTap: () {
                              final id = snapshot.data![index].id;
                              final merchantId =
                                  snapshot.data![index].merchant!['_id'];
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .performQuery(id!, context, merchantId)
                                  .then((val) => Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const Productdetail();
                                      })));
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                color: const Color(0xffFfFfFf),
                                border: Border.all(
                                    width: 1, color: const Color(0xfff8f8f8)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 100,
                                      width: (width - 50 - 15) / 2,
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF6F6F6),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      ),
                                      child: Image.network(
                                        '${snapshot.data![index].image}',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 6, 0, 2),
                                    child: design
                                        .smallText(snapshot.data![index].name),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(children: [
                                      design.amount(
                                          design.ash,
                                          12.0,
                                          snapshot.data![index].price
                                              .toString(),
                                          FontWeight.w500),
                                      const Spacer(),
                                      const Icon(Icons.favorite_outline,
                                          size: 12, color: Color(0xff0d0d0d))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
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
        }));
  }
}
