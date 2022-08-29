///
/// Created by Sunil Kumar from Boiler plate
///

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
