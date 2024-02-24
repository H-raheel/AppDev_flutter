import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_models.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  late Future<List<Albums>> futureUsersList;

  Future<List<Albums>> fetchUsers() async {
    Uri uriObject = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(uriObject);
    if (response.statusCode == 200) {
      List<dynamic> parsedListJson = jsonDecode(response.body);

      List<Albums> itemsList = List<Albums>.from(
        parsedListJson.map<Albums>(
          (dynamic user) => Albums.fromJson(user),
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Users'),
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
                    return Card(
                        child: ListTile(
                      leading: CircleAvatar(child: Image.network("hh")),
                      title: Text(index.toString()),
                      subtitle: Text(user.title),
                      trailing: Icon(Icons.visibility),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(user.title),
                                  ));
                            });
                      },
                    ));
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
