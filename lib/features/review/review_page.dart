// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiring_test/features/category/presentation/category_page.dart';
import 'package:hiring_test/features/product/model/product_model.dart';
import 'package:hiring_test/features/review/model/review_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reviewsProvider =
    FutureProvider.autoDispose.family<ReviewModel, int>((ref, productId) {
  return FirebaseFirestore.instance
      .collection('reviews')
      .where('product_id', isEqualTo: productId)
      .get()
      .then((event) {
    log("$productId");
    final list = <ReviewModel>[];
    for (var docs in event.docs) {
      list.add(ReviewModel.fromJson(docs.data()));
    }
    return list.isNotEmpty ? list.first : ReviewModel();
  });
});

class ReviewPage extends StatefulHookConsumerWidget {
  const ReviewPage({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewPageWidget();
}

class _ReviewPageWidget extends ConsumerState<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final review = ref.watch(reviewsProvider(widget.productModel.id));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Review',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 100,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            review.maybeWhen(orElse: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }, error: (e, s) {
              return Center(child: Text('$e'));
            }, data: (data) {
              if (data.reviews.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: Card(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Empty'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: data.reviews.map((e) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  NetworkImage('https://shorturl.at/zvl6Q'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Row(
                                              children: List.generate(
                                                  e.rating.round(),
                                                  (index) => const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 15,
                                                      )).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Today",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    e.comment,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
