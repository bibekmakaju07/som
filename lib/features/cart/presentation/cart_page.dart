// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hiring_test/features/cart/presentation/payment_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hiring_test/features/product/model/product_model.dart';

final cardProvider = StateProvider<List<CartModel>>((ref) {
  return [];
});

class CartPage extends StatefulHookConsumerWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardWidget();
}

class _CardWidget extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cardProvider);
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
                    'Cart',
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
            if (state.isEmpty)
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No items added to card\nPlease add product to cart ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: state.map((e) {
                        return IntrinsicHeight(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e.productModel.imageUrl,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return const SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Row(
                                        children: [
                                          Icon(Icons.error),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text('Error'),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.productModel.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${e.productModel.avgRating}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            r'$'
                                            '${e.productModel.price}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (e.itemCount < 2) {
                                                        return;
                                                      }

                                                      ref
                                                          .read(cardProvider
                                                              .notifier)
                                                          .update((state) {
                                                        final carlis = [
                                                          ...state
                                                        ];
                                                        final index =
                                                            state.indexOf(e);
                                                        carlis.removeAt(index);
                                                        final card = e.copyWith(
                                                            itemCount:
                                                                e.itemCount -
                                                                    1);
                                                        carlis.insert(
                                                          index,
                                                          card,
                                                        );
                                                        return carlis;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 26,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          width: e.itemCount > 1
                                                              ? 2
                                                              : 1,
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                    ),
                                                    child: Text(
                                                      '${e.itemCount}',
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    radius: 13,
                                                    onTap: () {
                                                      ref
                                                          .read(cardProvider
                                                              .notifier)
                                                          .update((state) {
                                                        final carlis = [
                                                          ...state
                                                        ];
                                                        final index =
                                                            state.indexOf(e);
                                                        carlis.removeAt(index);
                                                        final card = e.copyWith(
                                                            itemCount:
                                                                e.itemCount +
                                                                    1);
                                                        carlis.insert(
                                                          index,
                                                          card,
                                                        );
                                                        return carlis;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 26,
                                                      width: 26,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 2)),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomSheet: state.isEmpty
          ? const SizedBox()
          : Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                          r'$'
                          '${state.fold(0.0, (previousValue, element) => previousValue + (element.productModel.price * element.itemCount))}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (state.isNotEmpty) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PaymentPage();
                          }));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          )),
                      child: const Text(
                        'Check Out',
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

class CartModel extends Equatable {
  final ProductModel productModel;
  final int itemCount;
  final DateTime data;
  final String uuid;

  const CartModel({
    required this.productModel,
    required this.itemCount,
    required this.data,
    required this.uuid,
  });

  @override
  List<Object?> get props => [productModel, itemCount, data, uuid];

  CartModel copyWith({
    ProductModel? productModel,
    int? itemCount,
    DateTime? data,
    String? uuid,
  }) {
    return CartModel(
      productModel: productModel ?? this.productModel,
      itemCount: itemCount ?? this.itemCount,
      data: data ?? this.data,
      uuid: uuid ?? this.uuid,
    );
  }
}
