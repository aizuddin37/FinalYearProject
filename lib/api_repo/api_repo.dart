



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiRepo{
  final String url;
  final Map payload;


  ApiRepo({@required this.url, this.payload});

  Dio _dio=Dio();

  void get({
  Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
})

  {
    _dio.get(this.url, queryParameters: this.payload).then((response){
      if(onSuccess != null){
        onSuccess(response.data);

      }

    }).catchError((error){
      if(onError !=null){
        onError(error);
      }
    });
  }

}