import 'package:flutter/material.dart';
import '../api_data.dart';
import '../constants/constants.dart';
import '../data_models/data_model/data_model.dart';
import 'details_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black12,
          centerTitle: true,
          title: const Text(title),
        ),
        body: FutureBuilder<List<DataModel>>(
          future: ApiData.getData(storeBaseUrl, storeUrl),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];
                  return ListTile(
                    title: Text(item.category ?? 'No category'),
                    subtitle: Text(item.description ?? 'No description'),
                    onTap: () {
                      Get.to(() => DetailsScreen(
                            title: item.title!,
                            description: item.description!,
                            imageUrl: item.image!,
                          ));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
