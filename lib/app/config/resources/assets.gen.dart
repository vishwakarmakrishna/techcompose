/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/account_background.png
  AssetGenImage get accountBackground =>
      const AssetGenImage('assets/images/account_background.png');

  /// File path: assets/images/back.png
  AssetGenImage get back => const AssetGenImage('assets/images/back.png');

  /// File path: assets/images/clarity_download-line.png
  AssetGenImage get clarityDownloadLine =>
      const AssetGenImage('assets/images/clarity_download-line.png');

  /// File path: assets/images/generos.png
  AssetGenImage get generos => const AssetGenImage('assets/images/generos.png');

  /// File path: assets/images/hidden.png
  AssetGenImage get hidden => const AssetGenImage('assets/images/hidden.png');

  /// File path: assets/images/home_background.png
  AssetGenImage get homeBackground =>
      const AssetGenImage('assets/images/home_background.png');

  /// File path: assets/images/home_main_image.png
  AssetGenImage get homeMainImage =>
      const AssetGenImage('assets/images/home_main_image.png');

  /// File path: assets/images/landscape.png
  AssetGenImage get landscape =>
      const AssetGenImage('assets/images/landscape.png');

  /// File path: assets/images/landscape2.png
  AssetGenImage get landscape2 =>
      const AssetGenImage('assets/images/landscape2.png');

  /// File path: assets/images/main_background.png
  AssetGenImage get mainBackground =>
      const AssetGenImage('assets/images/main_background.png');

  /// File path: assets/images/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/images/menu.png');

  /// File path: assets/images/play.png
  AssetGenImage get play => const AssetGenImage('assets/images/play.png');

  /// File path: assets/images/plus.png
  AssetGenImage get plus => const AssetGenImage('assets/images/plus.png');

  /// File path: assets/images/portrait.png
  AssetGenImage get portrait =>
      const AssetGenImage('assets/images/portrait.png');

  /// File path: assets/images/portrait2.png
  AssetGenImage get portrait2 =>
      const AssetGenImage('assets/images/portrait2.png');

  /// File path: assets/images/poster1.png
  AssetGenImage get poster1 => const AssetGenImage('assets/images/poster1.png');

  /// File path: assets/images/poster2.png
  AssetGenImage get poster2 => const AssetGenImage('assets/images/poster2.png');

  /// File path: assets/images/poster3.png
  AssetGenImage get poster3 => const AssetGenImage('assets/images/poster3.png');

  /// File path: assets/images/poster4.png
  AssetGenImage get poster4 => const AssetGenImage('assets/images/poster4.png');

  /// File path: assets/images/poster5.png
  AssetGenImage get poster5 => const AssetGenImage('assets/images/poster5.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        accountBackground,
        back,
        clarityDownloadLine,
        generos,
        hidden,
        homeBackground,
        homeMainImage,
        landscape,
        landscape2,
        mainBackground,
        menu,
        play,
        plus,
        portrait,
        portrait2,
        poster1,
        poster2,
        poster3,
        poster4,
        poster5,
        profile,
        search
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
