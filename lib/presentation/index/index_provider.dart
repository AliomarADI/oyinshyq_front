import 'package:oyinshyq/app/data/models/toy_model.dart';
import 'package:oyinshyq/base/base_bloc.dart';

class IndexProvider extends BaseBloc {
  List<ToyModel> likedToys = [];

  addToLikedToys(ToyModel t) {
    likedToys.add(t);
    notifyListeners();
  }

  deleteToyFromCart(ToyModel t) {
    likedToys.remove(t);
    notifyListeners();
  }
}
