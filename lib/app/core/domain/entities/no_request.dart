import 'package:flutter_template_3/app/core/domain/entities/request.dart';

class NoRequest implements IRequest {
  @override
  Object toRequest() {
    return {};
  }
}
