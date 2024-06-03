part of "app_settings.dart";

Decoration gradientDecoration() => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Colors.deepPurple,
          Color.fromARGB(255, 195, 49, 221),
        ],
      ),
    );

Decoration mainBoxDecoration({
  required String image,
  required bool isFiltered,
  required bool isShadow,
}) =>
    BoxDecoration(
      color: AppColors.mainBlack,
      image: DecorationImage(
          colorFilter: isFiltered
              ? ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.7), // Adjust the opacity for shadow effect
                  BlendMode.darken,
                )
              : null,
          fit: BoxFit.cover,
          image: NetworkImage(image)),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        isShadow
            ? BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(0, 3))
            : const BoxShadow()
      ],
      border: Border(
        top: BorderSide(
          color: AppColors.withAlpha,
          width: 1,
        ),
      ),
    );
