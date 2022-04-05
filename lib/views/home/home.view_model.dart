import 'package:core/base/base_view.dart';
import 'package:core/locator.dart';
import 'package:core/services/api.service.dart';


class HomeViewModel extends BaseViewModel{
  final api = dependency<ApiService>();
  HomeViewModel();
  init()async{
  }

}