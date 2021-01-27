import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live_stream_with_firebase/models/url_model.dart';
import 'package:live_stream_with_firebase/services/database_service.dart';
import 'package:uuid/uuid.dart';

class LiveStream extends ChangeNotifier {
  final _databaseService = DatabaseService();
  final _uuid = Uuid();
  String _id;
  String _title;

  String get title => _title;
  Stream<List<UrlModel>> get liveStreamUrls => _databaseService.fetchProducts();

  set title(title) {
    _title = title;
    notifyListeners();
  }

  fetchProducts(UrlModel liveStream) {
    if (liveStream != null) {
      _id = liveStream.id;
      _title = liveStream.title;
    } else {
      _id = null;
      _title = null;
    }
  }
}
