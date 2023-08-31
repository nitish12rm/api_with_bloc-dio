// hmne ek alag se bana lia api ko fetch karne ke liye. ab ye common rahega sare repositories ke liye
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  Dio _dio = Dio();
  //hm chahte h ki jaise he api ka kabhi bhi object initialise ho
  //tab dio bhi sath me initialise hojaye isi liye hm iska ek
  //constructor banaynge

  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    //ab hm ek interceptor joki hmaare case me pretty dio logger hai usko
    //add kardenege jisse hoga ye ki jo bhi rqst jayngi wo log hojayega
    //automatically
    _dio.interceptors.add(PrettyDioLogger());
  }
  //kyuki _dio ek private entity hai isi liye iska hmne ek getter banadia
  //jisko hm use karsakenge
  Dio get sendRequest => _dio;
}
