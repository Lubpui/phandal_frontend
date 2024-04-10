import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/model/fetch_test.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<List<FetchTest>> usersfuture;

  @override
  void initState() {
    super.initState();
    usersfuture = usersfetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: usersfuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<FetchTest>? users = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.blueAccent,
                      ),
                      child: Column(
                        children: [
                          Text(users[index].name),
                          Text(users[index].email),
                          Text(users[index].phone),
                        ],
                      ));
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<List<FetchTest>> usersfetch() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1/users');
  final res = await http.get(url);

  if (res.statusCode == 200) {
    final usersRes = fetchTestFromJson(res.body);

    return usersRes;
  } else {
    throw Exception('Failed to load users');
  }
}
