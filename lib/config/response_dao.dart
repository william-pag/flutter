import 'package:pag_flutter/model/model.dart';

class ResponseDAO<T> {
  bool hasError;
  T? data;
  ErrorResponse? error;
  ResponseDAO({required this.hasError, this.data, this.error});
}
