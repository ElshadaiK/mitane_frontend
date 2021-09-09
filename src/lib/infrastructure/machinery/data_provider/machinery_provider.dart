
import 'package:dio/dio.dart';

class MachineryProvider{
  final Dio dio;

  MachineryProvider({required this.dio});

  Future<List<dynamic>> getMachinery() async{

    throw Exception();
  }
}