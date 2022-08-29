abstract class IRequest<T> {
  T toRequest();
}

abstract class IFileRequest {
  late final String fileName;
  late final String filePath;
  late final String contentType;
}
class NoRequest implements IRequest {
  @override
  Object toRequest() {
    return {};
  }
}
class NoParams {}