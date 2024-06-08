part of '../home_screen.dart';

Padding featuresNewsView(HomeScreenModel model, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, right: 20),
    child: Container(
      decoration: mainBoxDecoration(
        image: model.articleList[index].imageUrl,
        isFiltered: true,
        isShadow: true,
      ),
      width: 358,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 20, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: Space.v20),
            Text(
              model.articleList[index].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.medium.copyWith(
                fontSize: 28,
                color: AppColors.mainWhite,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
