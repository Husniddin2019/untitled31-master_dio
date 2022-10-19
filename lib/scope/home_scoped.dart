import 'package:scoped_model/scoped_model.dart';
import '../model/post.dart';
import '../service/http.dart';

class HomeScoped extends Model {
  List<Post> items =[];
  bool isLoading=false;
  Future apiPost() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePost(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();

  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;
    notifyListeners();
    return response!=null;
  }

  Future<bool> apiPostUpdate(Post post)async{
    isLoading = true;
    var response = Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    isLoading = false;
    notifyListeners();
    return response!=null;

  }

}
