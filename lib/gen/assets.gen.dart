/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/poppins
  $AssetsFontsPoppinsGen get poppins => const $AssetsFontsPoppinsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.svg
  String get appLogo => 'assets/images/app_logo.svg';

  /// File path: assets/images/app_logo_2.svg
  String get appLogo2 => 'assets/images/app_logo_2.svg';

  /// File path: assets/images/no_results_found.png
  AssetGenImage get noResultsFound =>
      const AssetGenImage('assets/images/no_results_found.png');

  /// File path: assets/images/placeholder.png
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/placeholder.png');

  /// List of all assets
  List<dynamic> get values => [appLogo, appLogo2, noResultsFound, placeholder];
}

class $AssetsFontsPoppinsGen {
  const $AssetsFontsPoppinsGen();

  /// File path: assets/fonts/poppins/OFL.txt
  String get ofl => 'assets/fonts/poppins/OFL.txt';

  /// File path: assets/fonts/poppins/Poppins-Black.ttf
  String get poppinsBlack => 'assets/fonts/poppins/Poppins-Black.ttf';

  /// File path: assets/fonts/poppins/Poppins-BlackItalic.ttf
  String get poppinsBlackItalic =>
      'assets/fonts/poppins/Poppins-BlackItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/poppins/Poppins-Bold.ttf';

  /// File path: assets/fonts/poppins/Poppins-BoldItalic.ttf
  String get poppinsBoldItalic => 'assets/fonts/poppins/Poppins-BoldItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'assets/fonts/poppins/Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraBoldItalic.ttf
  String get poppinsExtraBoldItalic =>
      'assets/fonts/poppins/Poppins-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'assets/fonts/poppins/Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraLightItalic.ttf
  String get poppinsExtraLightItalic =>
      'assets/fonts/poppins/Poppins-ExtraLightItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Italic.ttf
  String get poppinsItalic => 'assets/fonts/poppins/Poppins-Italic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/poppins/Poppins-Light.ttf';

  /// File path: assets/fonts/poppins/Poppins-LightItalic.ttf
  String get poppinsLightItalic =>
      'assets/fonts/poppins/Poppins-LightItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/poppins/Poppins-Medium.ttf';

  /// File path: assets/fonts/poppins/Poppins-MediumItalic.ttf
  String get poppinsMediumItalic =>
      'assets/fonts/poppins/Poppins-MediumItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/poppins/Poppins-Regular.ttf';

  /// File path: assets/fonts/poppins/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/poppins/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/poppins/Poppins-SemiBoldItalic.ttf
  String get poppinsSemiBoldItalic =>
      'assets/fonts/poppins/Poppins-SemiBoldItalic.ttf';

  /// File path: assets/fonts/poppins/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/poppins/Poppins-Thin.ttf';

  /// File path: assets/fonts/poppins/Poppins-ThinItalic.ttf
  String get poppinsThinItalic => 'assets/fonts/poppins/Poppins-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        ofl,
        poppinsBlack,
        poppinsBlackItalic,
        poppinsBold,
        poppinsBoldItalic,
        poppinsExtraBold,
        poppinsExtraBoldItalic,
        poppinsExtraLight,
        poppinsExtraLightItalic,
        poppinsItalic,
        poppinsLight,
        poppinsLightItalic,
        poppinsMedium,
        poppinsMediumItalic,
        poppinsRegular,
        poppinsSemiBold,
        poppinsSemiBoldItalic,
        poppinsThin,
        poppinsThinItalic
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String userList = 'assets/user_list.json';

  /// List of all assets
  static List<String> get values => [userList];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
