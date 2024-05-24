import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiring_test/features/cart/presentation/add_to_card_widget.dart';
import 'package:hiring_test/features/cart/presentation/cart_page.dart';
import 'package:hiring_test/features/product/model/product_model.dart';
import 'package:hiring_test/features/review/review_page.dart';
import 'package:hiring_test/features/review/widget/review_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class ProductDetailPage extends StatefulHookConsumerWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductDetailPage> {
  final listOfColor = [Colors.red, Colors.blue, Colors.teal, Colors.white];
  @override
  Widget build(BuildContext context) {
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
                  const CartIconWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Image.network(
                              widget.product.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) {
                                return const SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.error),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text('Error'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom: 10,
                              right: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: .5,
                                    color: Colors.black26,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    children: [1, 2, 3, 0]
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: CircleAvatar(
                                              radius: 12.5,
                                              backgroundColor: Colors.black38,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor: listOfColor[e],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [1, 2, 3, 4, 4]
                                .map(
                                  (e) => const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '${widget.product.avgRating}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            '(${1000} reviews)',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [39, 39.4, 40, 41]
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: .5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "$e",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                          '''Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. '''),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Review Product',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      RatingBar(
                        itemSize: 30,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            size: 10,
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(
                            Icons.star_half,
                            size: 10,
                            color: Colors.amber,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            size: 10,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (update) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ReviewPage(productModel: widget.product);
                              }));
                            },
                            child: const Text('View All'),
                          ),
                        ],
                      ),
                      ReviewWidget(
                        productModel: widget.product,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 9,
              spreadRadius: 4,
              offset: const Offset(
                0,
                -1,
              ),
              color: Colors.grey.shade100,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$' '${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      showDragHandle: true,
                      builder: (_) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: AddToCardWidget(widget.product),
                          ),
                        );
                      }).then((cartModel) {
                    if (cartModel is CartModel) {
                      ref.read(cardProvider.notifier).update((state) {
                        List<CartModel> card = [...state];
                        final l = card.firstWhereOrNull((element) =>
                            element.productModel.id ==
                            cartModel.productModel.id);
                        if (l != null) {
                          final index = card.indexOf(l);
                          card.removeAt(index);
                          card.add(
                            CartModel(
                              productModel: l.productModel,
                              itemCount: l.itemCount + cartModel.itemCount,
                              data: DateTime.now(),
                              uuid: const Uuid().v1(),
                            ),
                          );
                        } else {
                          card.add(cartModel);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart')));
                        return card;
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    )),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartIconWidget extends StatefulHookConsumerWidget {
  const CartIconWidget({
    super.key,
  });

  @override
  ConsumerState<CartIconWidget> createState() => _CustomAnState();
}

class _CustomAnState extends ConsumerState<CartIconWidget> {
  TickerFuture? tickerFuture;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        }));
      },
      child: SvgPicture.asset(
        'assets/svg/cart.svg',
      ),
    );
  }
}
