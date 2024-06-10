part of '../home_screen.dart';

Padding latestNewsView(HomeScreenModel model, int index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Observer(
      builder: (_) => Badge(
        offset: model.haveRead ? const Offset(-10, 0) : null,
        label: model.haveRead ? Text(t.screen.home.badgeText) : null,
        textColor: AppColors.mainBlack,
        backgroundColor: AppColors.mainWhite,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhite,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 5)),
            ],
          ),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Container(
                    width: 90,
                    decoration: mainBoxDecoration(
                        image: model.articleList[index].imageUrl,
                        isFiltered: false,
                        isShadow: false),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.articleList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.medium.copyWith(
                          color: AppColors.mainBlack,
                          fontSize: 16,
                        ),
                      ),
                      Space.v5,
                      Text(
                        timeago
                            .format(model.articleList[index].publicationDate),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
