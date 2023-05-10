import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/rest_client.dart';

final restClientProvider = Provider<RestClient>((ref) {
  return RestClient.create();
});
