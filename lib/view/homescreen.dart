import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadbtech_test/provider/homescreen_provider.dart';
import 'package:quadbtech_test/view/detailscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        Provider.of<HomescreenProvider>(context, listen: false).fetchMovie());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomescreenProvider>(builder: (context, value, child) {
        if (value.isloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.movielist.isEmpty) {
          return const Center(
            child: Text("No Data"),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (value.movielist.isNotEmpty &&
                    value.movielist[0].image?.original != null)
                  CachedNetworkImage(
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    imageUrl: value.movielist[0].image?.original ?? "",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                else
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Latest Movies",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.movielist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => Detailscreen(
                                      movie: value.movielist[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.all(9),
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error);
                              },
                              placeholder: (context, url) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              imageUrl:
                                  value.movielist[index].image?.original ?? "",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  "Popular Movies",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.movielist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => Detailscreen(
                                      movie: value.movielist[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.all(9),
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error);
                              },
                              placeholder: (context, url) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              imageUrl:
                                  value.movielist[index].image?.original ?? "",
                            ),
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
      }),
    );
  }
}
