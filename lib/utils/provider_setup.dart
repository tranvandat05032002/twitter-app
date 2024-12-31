import 'package:meteor_app/remote/movie_service.dart';
import 'package:meteor_app/remote/retrofit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Retrofit()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Retrofit, MovieService>(
    update: (context, retrofit, _) => MovieService(retrofit),
  ),
  // ProxyProvider<Retrofit, YoutubeService>(
  //   update: (context, retrofit, _) => YoutubeService(retrofit),
  // )
];