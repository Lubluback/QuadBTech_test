import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quadbtech_test/model/movie_model.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                width: (MediaQuery.of(context).size.width > 900)
                    ? 600
                    : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
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
                    imageUrl: movie.image?.original ?? ""),
              ),
              Positioned(
                  top: 25,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )))
            ]),
            const SizedBox(height: 10),
            Text(
              movie.name ?? "",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text(
              movie.summary ?? "",
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
