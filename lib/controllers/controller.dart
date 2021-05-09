import 'package:ecom_ui/models/requis_api_model.dart';
import 'package:ecom_ui/services/service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<PostData> _postData = [];

  List<PostData> get postData => _postData;

  bool _isLoading = true;
  bool get isloding => _isLoading;

  set postData(List<PostData> product) {
    _postData = postData;
    notifyListeners();
  }

  Services _services = Services();

  Future<void> fetchProductData() async {
    var data = await _services.fetchServer();

    _isLoading = false;

    _postData.addAll(data);

    notifyListeners();
  }
}
