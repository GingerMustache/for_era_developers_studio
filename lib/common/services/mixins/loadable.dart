import 'package:mobx/mobx.dart';

mixin Loadable {
  final isLoading = false.obs();

  void loadToggle() => runInAction(() => isLoading.value = !isLoading.value);
  void loadDrop() => runInAction(() => isLoading.value = false);
  void loadSet() => runInAction(() => isLoading.value = true);
}
