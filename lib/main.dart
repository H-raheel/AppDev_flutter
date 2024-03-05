import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 140, 184, 175)),
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
  late Future<List<Products>> futureUsersList;

  Future<List<Products>> fetchUsers() async {
    Uri uriObject = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(uriObject);
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body)["products"]);
      List<dynamic> parsedListJson = jsonDecode(response.body)["products"];
      // print("heree");
      print(parsedListJson);
      List<Products> itemsList = List<Products>.from(
        parsedListJson.map<Products>(
          (dynamic user) => Products.fromJson(user),
        ),
      );
      return itemsList;
    } else {
      throw Exception('Failed to load Album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureUsersList = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Products'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: futureUsersList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var user = snapshot.data![index];
                    return AspectRatio(
                      aspectRatio: 4 / 2.5,
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                          child: Card(

                              //     child: ListTile(
                              //   // leading: CircleAvatar(child: Image.network("hh")),
                              //   title: Text(index.toString()),
                              //   subtitle: Text(user.title),
                              //   trailing: Icon(Icons.visibility),
                              //   onTap: () {
                              //     showModalBottomSheet(
                              //         context: context,
                              //         builder: (context) {
                              //           return Container(
                              //               height: MediaQuery.of(context).size.width,
                              //               width: MediaQuery.of(context).size.width,
                              //               child: Center(
                              //                 child: Text(user.title),
                              //               ));
                              //         });
                              //   },
                              // )
                              clipBehavior: Clip.antiAlias,
                              elevation: 3,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              // child: SizedBox(
                              // height: 260,
                              // width: 600,
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // AspectRatio(
                                  //   aspectRatio: 18.0 / 11.0,
                                  //   child: Image.network(user.thumbnail),
                                  // ),
                                  AspectRatio(
                                    aspectRatio: 4 / 1,
                                    child: Image.network(user.thumbnail!,
                                        // height: 100,
                                        // width: 600,
                                        fit: BoxFit.cover),
                                  ),
                                  //  SizedBox(height: 20),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            user.title.length > 20
                                                ? user.title.substring(0, 20)
                                                : user.title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const Spacer(),
                                          Row(children: [
                                            Text(
                                              user.price.toString() + "USD",
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(width: 10),
                                            IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                            height: 0.5 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <Widget>[
                                                                SizedBox(
                                                                    height: 20),
                                                                SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: user
                                                                          .images
                                                                          .map((item) =>
                                                                              buildItemWidget(item))
                                                                          .toList(),
                                                                    )),
                                                                Text(
                                                                  user.title,
                                                                  maxLines: 1,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                Text(user
                                                                    .description!),
                                                                Text(
                                                                  "\$" +
                                                                      user.price
                                                                          .toString(),
                                                                  maxLines: 1,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ],
                                                            ));
                                                      });
                                                },
                                                icon: Icon(
                                                    Icons.remove_red_eye_sharp))
                                          ])
                                        ],
                                      )),
                                  //  const Spacer(),

                                  Text(
                                    user.description!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ))),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }

  Widget buildItemWidget(String item) {
    print(item);
    return Image.network(
      item,
      height: 120,
      width: 130,
    );
  }
}
