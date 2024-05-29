part of '../home_screen.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = getIt<HomeScreenModel>();

    return SizedBox(
      height: 390,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(t.screen.home.latestNews, style: sectionTextStyle),
          Expanded(
            child: ListView.builder(
              itemCount: model.articleListLength,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    offset: Offset(-10, 0),
                    label: Text('done'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(5, 5)),
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
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Space.v5,
                                  Text(
                                    timeago.format(model
                                        .articleList[index].publicationDate),
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
