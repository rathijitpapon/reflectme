import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.name,
    required this.profileImageUrl,
  });

  final String name;
  final String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello, ',
                      style: textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: name,
                      style: textTheme.headlineSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Your Private Journaling Space',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 22,
            backgroundImage: CachedNetworkImageProvider(profileImageUrl),
          ),
        ],
      ),
    );
  }
}