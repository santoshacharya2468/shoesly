import 'package:flutter/material.dart';
import 'package:shoesly/features/review/data/model/review.dart';

class SingleReviewView extends StatelessWidget {
  final Review review;
  const SingleReviewView({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(review.user.name ?? "username"),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(review.score.toString()),
              const Icon(Icons.star, color: Colors.yellow)
            ],
          ),
          Text(review.content),
        ],
      ),
    );
  }
}
