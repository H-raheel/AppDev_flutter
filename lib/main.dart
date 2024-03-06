import 'package:flutter/material.dart';
//import 'package:flutter_application_1/models/products.dart';
import 'models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 140, 184, 175)),
        useMaterial3: true,
      ),
      home: const UsersScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.title});

  final String title;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<APIDataModel>> futureItemsList;

  Future<List<APIDataModel>> fetchItems() async {
    Uri uriObject = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    final response = await http.get(uriObject);
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body)["products"]);
      List<dynamic> parsedListJson = jsonDecode(response.body);
      // print("heree");
      print(parsedListJson);
      List<APIDataModel> itemsList = List<APIDataModel>.from(
        parsedListJson.map<APIDataModel>(
          (dynamic items) => APIDataModel.fromJson(items),
        ),
      );
      return itemsList;
    } else {
      throw Exception('Failed to load Items');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureItemsList = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Products'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: futureItemsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: AspectRatio(
                            aspectRatio: 13 / 2.8,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    // constraints: Bo,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 1 /
                                            3 *
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    item.imageLink!,
                                                    height: 1 /
                                                        5 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 1 /
                                                        5 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(item.name!),
                                                      Text(item.description!,
                                                          maxLines: 4,
                                                          overflow: TextOverflow
                                                              .ellipsis)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Brand:' +
                                                      item.brand!.toUpperCase(),
                                                ),
                                                Spacer(),
                                                Text("\$" +
                                                    item.price!.toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                      itemCount: item
                                                          .productColors!
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        print(context);
                                                        return Text("n");
                                                      }),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                elevation: 3,
                                clipBehavior: Clip.antiAlias,
                                //color: Color.fromARGB(181, 255, 255, 255),
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.all(10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.network(item.imageLink!),
                                        Expanded(
                                          child: Text(
                                            item.name!,
                                            //   maxLines: 2,
                                            style: TextStyle(fontSize: 15),
                                            //softWrap: false,
                                            // overflow: TextOverflow.fade,
                                          ),
                                        ),
                                        // Spacer(),
                                        Text(
                                          '\$' + item.price!.toString(),
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 15),
                                          overflow: TextOverflow.fade,
                                        )
                                      ]),
                                ),
                              ),
                            )),
                      );
                    });
              } else
                return Text("none");
            },
          ),
        )

        // SafeArea(
        //     child: FutureBuilder(
        //   future: futureUsersList,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           itemCount: snapshot.data?.length,
        //           itemBuilder: (context, index) {
        //             var user = snapshot.data![index];
        //             return AspectRatio(
        //               aspectRatio: 4 / 2.5,
        //               // padding: const EdgeInsets.symmetric(vertical: 10),
        //               child: Padding(
        //                   padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
        //                   child: Card(

        //                       //     child: ListTile(
        //                       //   // leading: CircleAvatar(child: Image.network("hh")),
        //                       //   title: Text(index.toString()),
        //                       //   subtitle: Text(user.title),
        //                       //   trailing: Icon(Icons.visibility),
        //                       //   onTap: () {
        //                       //     showModalBottomSheet(
        //                       //         context: context,
        //                       //         builder: (context) {
        //                       //           return Container(
        //                       //               height: MediaQuery.of(context).size.width,
        //                       //               width: MediaQuery.of(context).size.width,
        //                       //               child: Center(
        //                       //                 child: Text(user.title),
        //                       //               ));
        //                       //         });
        //                       //   },
        //                       // )
        //                       clipBehavior: Clip.antiAlias,
        //                       elevation: 3,
        //                       shape: const RoundedRectangleBorder(
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(20))),
        //                       // child: SizedBox(
        //                       // height: 260,
        //                       // width: 600,
        //                       child: Column(
        //                         // mainAxisAlignment:
        //                         //     MainAxisAlignment.spaceBetween,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: <Widget>[
        //                           // AspectRatio(
        //                           //   aspectRatio: 18.0 / 11.0,
        //                           //   child: Image.network(user.thumbnail),
        //                           // ),
        //                           AspectRatio(
        //                             aspectRatio: 4 / 1,
        //                             child: Image.network(user.thumbnail,
        //                                 // height: 100,
        //                                 // width: 600,
        //                                 fit: BoxFit.cover),
        //                           ),
        //                           //  SizedBox(height: 20),
        //                           Padding(
        //                               padding:
        //                                   const EdgeInsets.fromLTRB(5, 0, 5, 0),
        //                               child: Row(
        //                                 children: [
        //                                   Text(
        //                                     user.title.length > 20
        //                                         ? user.title.substring(0, 20)
        //                                         : user.title,
        //                                     maxLines: 1,
        //                                     style: const TextStyle(
        //                                         fontWeight: FontWeight.bold,
        //                                         fontSize: 18),
        //                                   ),
        //                                   const Spacer(),
        //                                   Row(children: [
        //                                     Text(
        //                                       user.price.toString() + "USD",
        //                                       maxLines: 1,
        //                                       style: const TextStyle(
        //                                           fontWeight: FontWeight.bold,
        //                                           fontSize: 18),
        //                                     ),
        //                                     const SizedBox(width: 10),
        //                                     IconButton(
        //                                         onPressed: () {
        //                                           showBottomSheet(
        //                                               elevation: 20,
        //                                               context: context,
        //                                               builder: (context) {
        //                                                 APIDataModel prod =
        //                                                     user;
        //                                                 return Container(
        //                                                   height: 0.5 *
        //                                                       MediaQuery.of(
        //                                                               context)
        //                                                           .size
        //                                                           .height,
        //                                                   child: Column(
        //                                                     mainAxisAlignment:
        //                                                         MainAxisAlignment
        //                                                             .spaceAround,
        //                                                     mainAxisSize:
        //                                                         MainAxisSize
        //                                                             .min,
        //                                                     children: [
        //                                                       AspectRatio(
        //                                                         aspectRatio:
        //                                                             3 / 1,
        //                                                         child: Expanded(
        //                                                           child: ListView.builder(
        //                                                               scrollDirection: Axis.horizontal,
        //                                                               // shrinkWrap:
        //                                                               //     true,
        //                                                               itemCount: prod.images.length,
        //                                                               itemBuilder: (context, index) {
        //                                                                 return Padding(
        //                                                                   padding: const EdgeInsets
        //                                                                       .symmetric(
        //                                                                       horizontal: 8),
        //                                                                   child:
        //                                                                       Image.network(prod.images[index]),
        //                                                                 );
        //                                                               }),
        //                                                         ),
        //                                                       ),
        //                                                       Column(
        //                                                         children: [
        //                                                           Text(prod
        //                                                               .title),
        //                                                           Text(prod
        //                                                               .description),
        //                                                           Text(
        //                                                               "\$ ${prod.price}"),
        //                                                           Row(
        //                                                             mainAxisAlignment:
        //                                                                 MainAxisAlignment
        //                                                                     .spaceBetween,
        //                                                             children: [
        //                                                               const Row(
        //                                                                 children: [
        //                                                                   Icon(Icons
        //                                                                       .star)
        //                                                                 ],
        //                                                               ),
        //                                                               Row(
        //                                                                 children: [
        //                                                                   Text(
        //                                                                       "${prod.discountPercentage} %"),
        //                                                                   const Icon(
        //                                                                     Icons.discount,
        //                                                                   )
        //                                                                 ],
        //                                                               ),
        //                                                             ],
        //                                                           )
        //                                                         ],
        //                                                       ),
        //                                                     ],
        //                                                   ),
        //                                                 );
        //                                               });
        //                                         },
        //                                         icon: const Icon(
        //                                             Icons.remove_red_eye_sharp))
        //                                   ])
        //                                 ],
        //                               )),
        //                           //  const Spacer(),

        //                           Text(
        //                             user.description,
        //                             overflow: TextOverflow.ellipsis,
        //                             maxLines: 2,
        //                           ),
        //                         ],
        //                       ))),
        //             );
        //           });
        //     } else if (snapshot.hasError) {
        //       return Text(snapshot.error.toString());
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ) // This trailing comma makes auto-formatting nicer for build methods.
        //     )

        );
  }

  List buildList(Map<String, dynamic> toJson) {
    List<String> list = List.empty();
    toJson.forEach((k, v) => list.add((k)));
    print(list);

    return List.empty();
  }
}
