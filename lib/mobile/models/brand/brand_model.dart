import 'package:flutter/material.dart';
import 'package:ymk_pos/data/models/brand.dart';
import 'package:ymk_pos/data/request/request.dart';

enum BrandModelStatus { Ended, Loading, Error }

class BrandModel extends ChangeNotifier {
  var _client = RestClient.create();
  BrandModelStatus _status;
  String _errorCode;
  String _errorMessage;
  List<Brand> _brandList;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  BrandModelStatus get status => _status;
  List<Brand> get brandList => _brandList;

  BrandModel.instance() {
    getBrandList();
  }

  void getBrandList() async {
    _status = BrandModelStatus.Loading;
    notifyListeners();
    _brandList = await _client.getBrand();
    _status = BrandModelStatus.Ended;
    notifyListeners();
  }
}