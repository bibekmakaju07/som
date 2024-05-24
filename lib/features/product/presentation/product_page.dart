import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiring_test/features/category/model/category_model.dart';
import 'package:hiring_test/features/category/presentation/category_page.dart';
import 'package:hiring_test/features/product/model/product_model.dart';
import 'package:hiring_test/features/product/presentation/product_details.dart';
import 'package:hiring_test/features/product/presentation/product_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productProvider = FutureProvider.autoDispose<List<ProductModel>>((ref) {
  final category = ref.watch(filterProvider);

  return FirebaseFirestore.instance
      .collection('product')
      .where('category_id',
          isEqualTo: (category.categoryModel == null ||
                  category.categoryModel?.id == -1)
              ? null
              : category.categoryModel!.id)
      .where('gender', isEqualTo: category.gender?.toLowerCase())
      .get()
      .then((event) {
    final list = <ProductModel>[];
    for (var docs in event.docs) {
      list.add(ProductModel.fromJson(docs.data()));
    }
    // if (category.categoryModel == null || category.categoryModel?.id == -1) {
    return list;
  });
});
final filterProvider = StateProvider.autoDispose<FilterModel>((ref) {
  return FilterModel(
    categoryModel: CategoryModel(id: -1, name: "All"),
  );
});

class ProductPage extends StatefulHookConsumerWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(fontSize: 16),
                      ),
                      CartIconWidget(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: CategoryWidget(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer(builder: (context, ref, __) {
                    final cat = ref.watch(filterProvider);
                    return Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        if (cat.gender != null)
                          FilterChip(
                            onSelected: (_) {},
                            onDeleted: () {
                              ref.read(filterProvider.notifier).update(
                                    (state) => FilterModel(
                                        categoryModel: state.categoryModel,
                                        color: state.color,
                                        gender: null,
                                        priceRange: state.priceRange,
                                        sortBy: state.sortBy),
                                  );
                            },
                            label: Text('${cat.gender}'),
                          ),
                        if (cat.sortBy != null)
                          FilterChip(
                            onSelected: (_) {},
                            onDeleted: () {
                              ref.read(filterProvider.notifier).update(
                                    (state) => FilterModel(
                                      categoryModel: state.categoryModel,
                                      color: state.color,
                                      gender: state.gender,
                                      priceRange: state.priceRange,
                                      sortBy: null,
                                    ),
                                  );
                            },
                            label: Text('${cat.sortBy}'),
                          ),
                      ],
                    );
                  }),
                ),
                state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }, error: (e, s) {
                  return Center(child: Text('$e'));
                }, data: (data) {
                  if (data.isEmpty) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: AutoHeightGridView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            itemCount: data.length,
                            builder: (context, index) {
                              return ProductTile(
                                item: data[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
            ref.watch(categoryProvider).maybeWhen(orElse: () {
              return const SizedBox();
            }, data: (data) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FilterProductPage(
                          categoryList: data,
                          filterModel: ref.watch(filterProvider),
                        );
                      })).then((value) {
                        if (value is FilterModel) {
                          ref
                              .read(filterProvider.notifier)
                              .update((state) => value);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/filter-1.svg',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'FILTER',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

class ProductTile extends StatefulHookConsumerWidget {
  const ProductTile({super.key, required this.item});
  final ProductModel item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductTileState();
}

class _ProductTileState extends ConsumerState<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetailPage(
            product: widget.item,
          );
        }));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.item.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (_, __, l) {
                return Center(
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Transform.scale(
                          scale: 0.2,
                          child: const CircularProgressIndicator.adaptive()),
                    ),
                  ),
                );
              },
              errorBuilder: (_, __, ___) {
                return const SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.item.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '${widget.item.avgRating}',
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
          Text(
            '${r'$'}${widget.item.price}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
