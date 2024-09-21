import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class JournalImageCarousel extends StatelessWidget {
  const JournalImageCarousel({
    super.key,
    required this.imageHeight,
    required this.imageUrls,
  });

  final double imageHeight;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CarouselSlider(
        options: CarouselOptions(
          height: imageHeight,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: imageUrls.length > 1,
          autoPlayInterval: Duration(seconds: 5),
        ),
        items: imageUrls.map((imageUrl) {
          return CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }
}