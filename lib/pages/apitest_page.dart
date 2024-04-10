import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/APITestmodel.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  late Future<List<ApiTestModel>> apifuture;

  @override
  void initState() {
    super.initState();
    apifuture = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A P I T E S T"),
      ),
      body: Center(
        child: FutureBuilder(
          future: apifuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ApiTestModel>? api = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: api!.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: AppPallete.uiColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(api[index].name),
                                Text(api[index].username),
                                Text(api[index].phone.toString()),
                              ],
                            ),
                            const Icon(Icons.person)
                          ],
                        ),
                      ));
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<ApiTestModel>> fetchData() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1/users");
  final res = await http.get(url);
  if (res.statusCode == 200) {
    final apiRes = apiTestModelFromJson(res.body);
    print(apiRes);
    return apiRes;
  } else {
    throw Exception('Failed');
  }
}
