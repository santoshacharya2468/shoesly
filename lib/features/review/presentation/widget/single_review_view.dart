import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/features/review/data/model/review.dart';

class SingleReviewView extends StatelessWidget {
  final Review review;
  const SingleReviewView({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: review.user.imageUrl != null
            ? CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(review.user.imageUrl!),
              )
            : const CircleAvatar(),
        title: Text(review.user.name ?? "username",
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(review.score.toString()),
                const Icon(Icons.star, color: Colors.yellow)
              ],
            ),
            Text(
              review.content,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
