import 'dart:developer';

import 'package:dio_and_api/models/product_model.dart';
import 'package:dio_and_api/services/api_service.dart';
import 'package:flutter/widgets.dart';

void main() async {
  ApiService service = ApiService();

  // final data = await service.getUserById(12);
  //
  // data.id = 300;
  // final response = await service.postProduct(data);
  //
  // print(response.statusCode);

  // Product product = await service.getUserById(5);
  // product.price = 10;
  // product.title = "Black Nail Polish";

  // final response = await service.patchProduct(5, {'title' : "Black Nail Polish "});
  //
  // debugPrint(response.statusCode.toString());

  // final response = await service.deleteProduct(7);
  // print(response.statusCode);

  Product product = await service.getUserById(6);

  print(product.images![0]);
  // final response2 = await service.downloadFile(
  //   product.images![0],
  //   "/home/erkin/Decktop/mobbile_app/rasm.webp",
  // );
  // print(response2.statusCode);

  final response = await service.uploadFile(6, "rasm.webp");
  print(response.statusCode);
}
