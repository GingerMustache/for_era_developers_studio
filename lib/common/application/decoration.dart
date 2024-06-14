part of "app_settings.dart";

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
                  Colors.black.withOpacity(0.7),
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
