import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadbtech_test/provider/homescreen_provider.dart';
import 'package:quadbtech_test/view/detailscreen.dart';

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});
  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.black,
        title: TextFormField(
          onChanged: (value) {
            _debouncer.run(
              () {
                if (value.trim().isEmpty) {
                  Provider.of<HomescreenProvider>(context, listen: false)
                      .fetchMovie();
                } else {
                  Provider.of<HomescreenProvider>(context, listen: false)
                      .fetchMovie(search: value);
                }
              },
            );
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey)),
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
      body: Consumer<HomescreenProvider>(
          builder: (BuildContext ctx, value, child) {
        if (value.isloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.movielist.isEmpty) {
          return const Center(
            child: Text("No result"),
          );
        }
        return GridView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .6,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
          ),
          itemCount: value.movielist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) =>
                            Detailscreen(movie: value.movielist[index])));
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
                    imageUrl: value.movielist[index].image?.original ?? "",
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
