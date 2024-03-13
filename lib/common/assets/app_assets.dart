import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  AppAssets._();

  static final AppAssets init = AppAssets._();

  static const _svgAsset = 'assets/svgs/';
  AppAssetBuilder get iconHomeActive =>
      AppAssetBuilder('${_svgAsset}icon_home_active.svg');
  AppAssetBuilder get iconHomeInactive =>
      AppAssetBuilder('${_svgAsset}icon_home_inactive.svg');
  AppAssetBuilder get iconCreateActive =>
      AppAssetBuilder('${_svgAsset}icon_home_active.svg');
  AppAssetBuilder get iconCreateInactive =>
      AppAssetBuilder('${_svgAsset}icon_home_active.svg');
  AppAssetBuilder get iconSearchInactive =>
      AppAssetBuilder('${_svgAsset}icon_search_inactive.svg');
  AppAssetBuilder get iconSearchActive =>
      AppAssetBuilder('${_svgAsset}icon_search_active.svg');
  AppAssetBuilder get iconReelsInactive =>
      AppAssetBuilder('${_svgAsset}icon_reels_inactive.svg');
  AppAssetBuilder get iconReelsActive =>
      AppAssetBuilder('${_svgAsset}icon_reels_active.svg');
  AppAssetBuilder get iconLogoText =>
      AppAssetBuilder('${_svgAsset}icon_logo_text.svg');
  AppAssetBuilder get iconMessenger =>
      AppAssetBuilder('${_svgAsset}icon_messenger.svg');
}

class AppAssetBuilder {
  AppAssetBuilder(this.assetPath);

  final String assetPath;

  static Widget loadAssetImage(String url,
      {bool withWhiteTextureBelow = true}) {
    if (url.isEmpty) {
      return const Text('url is empty');
    }
    if (url.contains('.svg')) {
      return SvgPicture.network(
        url,
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, _) => const SizedBox.shrink(),
        errorWidget: (context, error, object) => Container(
          height: 20,
          width: 20,
          color: Colors.amber,
        ),
      );
    }
  }

  Widget widget({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BorderRadius? borderRadius,
    Widget? placeholder,
    String? errorImageUrl,
  }) {
    return AssetBuilder(
      assetPath,
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      placeholder: placeholder,
      errorImageUrl: errorImageUrl,
    );
  }
}

class AssetBuilder extends StatelessWidget {
  const AssetBuilder(
    this.input, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.placeholder,
    this.errorImageUrl,
  });

  final String input;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  final Widget? placeholder;
  final String? errorImageUrl;

  @override
  Widget build(BuildContext context) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: _image(),
      );
    }
    return _image();
  }

  Widget _placeholder() {
    return placeholder ?? Container(color: Colors.white);
  }

  Widget _image() {
    try {
      if (input.isEmpty == true) {
        return _placeholder();
      }
      if (input is Uint8List) {
        return Image.memory(input as Uint8List,
            height: height,
            color: color,
            width: width,
            fit: fit,
            alignment: alignment);
      }
      final bool isNetworkMedia = input.startsWith('http');
      if (input.endsWith('svg')) {
        if (isNetworkMedia) {
          return SvgPicture.network(input,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              alignment: alignment);
        }
        return SvgPicture.asset(input,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            alignment: alignment);
      }
      if (isNetworkMedia) {
        return SizedBox(
          width: width,
          height: height,
          child: Image.network(
            input,
            fit: BoxFit.cover,
          ),
        );
      }
      return Image(
        image: AssetImage(input),
        height: height,
        color: color,
        width: width,
        fit: fit,
        alignment: alignment,
      );
    } on Exception catch (_) {
      return const SizedBox.shrink();
    }
  }
}
