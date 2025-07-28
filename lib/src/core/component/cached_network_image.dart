import 'package:cached_network_image/cached_network_image.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:city17/src/core/utils/get_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.errorIcon,
    required this.fit,
  });

  final String imageUrl;
  final String errorIcon;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return GetUtils.valiDateUrl(imageUrl)
        ? CachedNetworkImage(
            imageUrl: imageUrl,

            fit: fit,

            placeholder: (context, text) {
              return const Center(child: CupertinoActivityIndicator());
            },

            errorWidget: (context, String, dd) {
              return Center(child: SvgPicture.asset(AssetString.imageError));
            },
          )
        : SvgPicture.asset(AssetString.imageError, fit: BoxFit.cover);
  }
}
