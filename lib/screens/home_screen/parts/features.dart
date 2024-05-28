part of '../home_screen.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          t.screen.home.featured,
          style: sectionTextStyle,
        ),
        Space.v10,
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.pushNamed(
                  mainRoutesName(MainRoutes.newsScreen),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: mainBoxDecoration(
                      image: imageLink,
                      isFiltered: true,
                      isShadow: true,
                    ),
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40, left: 20, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(child: Space.v20),
                          Text(
                            t.screen.home.testText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.mainWhite,
                              fontSize: 25,
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
    );
  }
}
