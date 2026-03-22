import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';

Widget showFlag({
  required BuildContext context,
  required String url,
  double borderRadius = 50,
  double w = 0,
  double h = 0,
}) {
  double height = h == 0 ? context.wp(5.5) : context.wp(h);
  double width = w == 0 ? context.wp(5.5) : context.wp(w);
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: url.isEmpty
        ? Image.asset("", height: height, width: width, fit: BoxFit.cover)
        : CachedNetworkImage(
            imageUrl: url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 300),
            placeholder: (context, url) => SizedBox(
              height: height,
              width: width,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2, color: AppColor.subText),
              ),
            ),
            errorWidget: (context, url, error) =>
                Image.asset("", height: height, width: width, fit: BoxFit.cover),
          ),
  );
}

Widget showPlayer({
  required BuildContext context,
  required String url,
  double w = 0,
  double h = 0,
  double r = 0,
}) {
  double height = h == 0 ? context.wp(5.5) : context.wp(h);
  double width = w == 0 ? context.wp(5.5) : context.wp(w);
  double radius = r == 0 ? 50 : r;

  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: url.isEmpty
        ? Image.asset("", height: height, width: width, fit: BoxFit.cover)
        : CachedNetworkImage(
            imageUrl: url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 300),
            placeholder: (context, url) => SizedBox(
              height: height,
              width: width,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
                Image.asset("", height: height, width: width, fit: BoxFit.cover),
          ),
  );
}
