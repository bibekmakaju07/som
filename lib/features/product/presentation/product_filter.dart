// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hiring_test/features/category/model/category_model.dart';

enum ProductSort {
  mostRecent(title: 'Most Recent', value: 'recent'),
  lowestPrice(title: 'Lowest Price', value: 'lowest'),
  highestPrice(title: 'Highest Recent', value: 'highest');

  const ProductSort({required this.title, required this.value});

  final String title;
  final String value;
}

enum Gender {
  male(title: 'Male'),
  female(title: 'Female'),
  unisex(title: 'unisex');

  const Gender({required this.title});

  final String title;
}

class FilterProductPage extends StatefulHookConsumerWidget {
  const FilterProductPage({
    super.key,
    this.categoryList = const [],
    this.filterModel,
  });
  final List<CategoryModel> categoryList;
  final FilterModel? filterModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<FilterProductPage> {
  final listOfColor = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.white,
  ];
  late FilterModel filterModel;
  @override
  void initState() {
    filterModel = widget.filterModel ?? const FilterModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
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
                    'Filter',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Brands',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.categoryList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                filterModel = filterModel.copyWith(
                                  categoryModel: e,
                                );
                                setState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        child: Text(
                                          e.name.split('').first.toUpperCase(),
                                        ),
                                      ),
                                      if (filterModel.categoryModel?.id == e.id)
                                        Positioned(
                                          right: 1,
                                          bottom: 1,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle),
                                            child: const Padding(
                                              padding: EdgeInsets.all(2),
                                              child: Icon(
                                                Icons.check,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Price range',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    LayoutBuilder(builder: (context, constraint) {
                      final maxWidth = constraint.maxWidth - 50;
                      return Column(
                        children: [
                          SliderTheme(
                            data: const SliderThemeData(
                              overlayColor: Colors.transparent,
                              activeTrackColor: Colors.black,

                              rangeThumbShape:
                                  CircleThumbShape(thumbRadius: 12),
                              activeTickMarkColor: Colors.black,

                              // overlayShape: SliderComponentShape.noOverlay,
                            ),
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RangeSlider(
                                values: RangeValues(
                                    filterModel.priceRange?.lower ?? 100,
                                    filterModel.priceRange?.higher ?? 1000),
                                onChanged: (value) {
                                  filterModel = filterModel.copyWith(
                                      priceRange: (
                                        lower: value.start,
                                        higher: value.end
                                      ));
                                  setState(() {});
                                },
                                divisions: 9,
                                min: 100,
                                max: 1000,
                                labels: RangeLabels(
                                  filterModel.priceRange != null
                                      ? '${filterModel.priceRange?.lower.round()}'
                                      : '100',
                                  filterModel.priceRange != null
                                      ? "${filterModel.priceRange?.higher.round()}"
                                      : '1000',
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ProductSort.values
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, bottom: 1),
                                child: InkWell(
                                  onTap: () {
                                    filterModel =
                                        filterModel.copyWith(sortBy: e.value);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: filterModel.sortBy == e.value
                                            ? Colors.black
                                            : null,
                                        border: Border.all(
                                          width: 0.3,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        e.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: filterModel.sortBy == e.value
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Gender.values
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {
                                    filterModel =
                                        filterModel.copyWith(gender: e.name);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: filterModel.gender == e.name
                                            ? Colors.black87
                                            : null,
                                        border: Border.all(
                                          width: 0.4,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        e.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: filterModel.gender == e.name
                                              ? Colors.white
                                              : Colors.black54,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [1, 2, 3, 0]
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    filterModel = filterModel.copyWith(
                                        color: listOfColor[e].toString());
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: filterModel.color ==
                                                  listOfColor[e].toString()
                                              ? 1.5
                                              : 0.6),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 0.2),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: listOfColor[e],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Color')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              OutlinedButton(
                onPressed: () {
                  filterModel = const FilterModel();
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                )),
                child: Text(
                  'Reset (${filterModel.props.where((element) => element != null).length})',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, filterModel);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    )),
                child: const Text(
                  'Apply',
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

class CircleThumbShape extends RangeSliderThumbShape {
  const CircleThumbShape({this.thumbRadius = 10.0});

  final double thumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool? isDiscrete = false,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, borderPaint);
    canvas.drawCircle(center, thumbRadius - 2, fillPaint);
    canvas.drawCircle(center, thumbRadius - 4, borderPaint);
  }
}

class FilterModel extends Equatable {
  final CategoryModel? categoryModel;
  final ({double lower, double higher})? priceRange;
  final String? sortBy;
  final String? gender;
  final String? color;

  const FilterModel({
    this.categoryModel,
    this.priceRange,
    this.sortBy,
    this.gender,
    this.color,
  });

  @override
  List<Object?> get props => [categoryModel, sortBy, gender, color, priceRange];

  FilterModel copyWith({
    CategoryModel? categoryModel,
    String? sortBy,
    String? gender,
    String? color,
    final ({double lower, double higher})? priceRange,
  }) {
    return FilterModel(
      categoryModel: categoryModel ?? this.categoryModel,
      sortBy: sortBy ?? this.sortBy,
      gender: gender ?? this.gender,
      color: color ?? this.color,
      priceRange: priceRange ?? this.priceRange,
    );
  }
}
