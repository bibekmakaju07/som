import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiring_test/features/cart/presentation/cart_page.dart';
import 'package:hiring_test/features/product/model/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddToCardWidget extends StatefulHookConsumerWidget {
  const AddToCardWidget(this.productModel, {super.key});
  final ProductModel productModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddToCardWidgetState();
}

class _AddToCardWidgetState extends ConsumerState<AddToCardWidget> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: "1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _textEditingController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    final a = int.tryParse(_textEditingController.text) ?? 1;
                    if (a > 1) {
                      _textEditingController.text = '${a - 1}';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.remove,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    final a = int.tryParse(_textEditingController.text) ?? 0;

                    _textEditingController.text = '${a + 1}';
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$323',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      CartModel(
                          uuid: const Uuid().v1(),
                          productModel: widget.productModel,
                          itemCount:
                              int.tryParse(_textEditingController.text) ?? 1,
                          data: DateTime.now()));
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
      ],
    );
  }
}
