import 'package:savetosafe/core/utils/globals.dart';

abstract class APIBase<T> {
  final BASE_URL = 'https://backend.savetosafe.com/api/v1';

  final headers = <String, String>{}..addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Globals.accessToken}',
    });

  Future<List<T>> get();

  Future<T> create(T item);

  Future<T> update(T item);

  Future<bool> delete(int id);
}
