import 'package:dio/dio.dart';
import 'package:dio_and_api/models/product_model.dart';

class ApiService {
  late Dio dio;
  static const baseUrl = 'https://dummyjson.com';
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 10), // ulanishga 10 soniya kutadi
        receiveTimeout: Duration(seconds: 10), // javobga 10 soniya kutadi
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
  Future<List<Product>> getProducts() async {
    final response = await dio.get("/products");

    List<dynamic> products = response.data["products"];
    List<Product> listProducts = products
        .map((e) => Product.fromJson(e))
        .toList();
    return listProducts;
  }

  Future<Product> getUserById(int id) async {
    final response = await dio.get("/product/$id");
    return Product.fromJson(response.data);
  }
  Future<Response> postProduct(Product product) async {
    final response = await dio.post("/products/add",data: product.toJson());
    return response;
  }
  Future<Response> putProduct(int id, Product product )async{
    final response = await dio.put("/products/$id",data: product.toJson());
    return response;
  }
  Future<Response> patchProduct(int id, Map<String, dynamic> map)async{
    final responce = await dio.patch("/product/$id",data: map);
    return responce;

  }
  Future<Response> deleteProduct(int id)async{
    final response = await dio.delete("/product/$id");
    return response;
  }
  Future<Response> downloadFile(String joylashuv1,String joylashuv2)async{
    final response = await dio.download(joylashuv1, joylashuv2, );

    return response;
  }

  Future<Response> uploadFile(int id,String url)async{
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
          url,           // faylning telefondagi joyi
          filename: 'rasm.webp' // serverga qanday nom bilan borishi
      ),
    });
    final response = await dio.patch("/product/$id",data: formData);
    return response;
  }

}
