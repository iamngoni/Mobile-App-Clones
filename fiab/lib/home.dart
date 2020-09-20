import 'package:fiab/api.dart';
import 'package:fiab/colors.dart';
import 'package:fiab/constants.dart';
import 'package:fiab/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiabHome extends StatefulWidget {
  @override
  _FiabHomeState createState() => _FiabHomeState();
}

class _FiabHomeState extends State<FiabHome> {
  FiabApi _api;

  @override
  void initState() {
    _api = new FiabApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FiabProvider>(
      builder: (context, fiab, _) {
        return Container(
          height: getHeight(context),
          width: getWidth(context),
          child: FutureBuilder(
            future: _api.loadCategories(),
            builder: (context, snapshot) {
              print(snapshot.data["data"]);
              fiab.saveData(snapshot.data["data"]);
              while (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: fiab.data.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: _api.loadProducts(),
                      builder: (context, snapshot) {
                        fiab.saveProducts(snapshot.data["data"]);
                        while (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(
                          height: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fiab.data[index]["name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: dark.withOpacity(0.8),
                                  ),
                                ),
                                Container(
                                  height: 250,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: fiab.products
                                        .where(
                                          (x) =>
                                              x["product_type"]["name"] ==
                                              fiab.data[index]["name"],
                                        )
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Image(
                                          image: NetworkImage(
                                            fiab.products[index]["image_url"],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              );
            },
          ),
        );
      },
    );
  }
}
