// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/.gitkeep
  String get aGitkeep => 'assets/image/.gitkeep';

  /// File path: assets/image/center shining light.png
  AssetGenImage get centerShiningLight =>
      const AssetGenImage('assets/image/center shining light.png');

  /// File path: assets/image/left shining light.png
  AssetGenImage get leftShiningLight =>
      const AssetGenImage('assets/image/left shining light.png');

  /// File path: assets/image/linked in icon.png
  AssetGenImage get linkedInIcon =>
      const AssetGenImage('assets/image/linked in icon.png');

  /// File path: assets/image/log in background blur.png
  AssetGenImage get logInBackgroundBlur =>
      const AssetGenImage('assets/image/log in background blur.png');

  /// File path: assets/image/megaphone icon.png
  AssetGenImage get megaphoneIcon =>
      const AssetGenImage('assets/image/megaphone icon.png');

  /// File path: assets/image/oraimo earbuds.png
  AssetGenImage get oraimoEarbuds =>
      const AssetGenImage('assets/image/oraimo earbuds.png');

  /// File path: assets/image/right shining light.png
  AssetGenImage get rightShiningLight =>
      const AssetGenImage('assets/image/right shining light.png');

  /// File path: assets/image/whatsapp icon.png
  AssetGenImage get whatsappIcon =>
      const AssetGenImage('assets/image/whatsapp icon.png');

  /// File path: assets/image/x icon.png
  AssetGenImage get xIcon => const AssetGenImage('assets/image/x icon.png');

  /// List of all assets
  List<dynamic> get values => [
    aGitkeep,
    centerShiningLight,
    leftShiningLight,
    linkedInIcon,
    logInBackgroundBlur,
    megaphoneIcon,
    oraimoEarbuds,
    rightShiningLight,
    whatsappIcon,
    xIcon,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/.gitkeep
  String get aGitkeep => 'assets/svg/.gitkeep';

  /// File path: assets/svg/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/svg/apple.svg');

  /// File path: assets/svg/copy icon.svg
  SvgGenImage get copyIcon => const SvgGenImage('assets/svg/copy icon.svg');

  /// File path: assets/svg/google.svg.svg
  SvgGenImage get googleSvg => const SvgGenImage('assets/svg/google.svg.svg');

  /// File path: assets/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svg/logo.svg');

  /// File path: assets/svg/platform cube.svg
  SvgGenImage get platformCube =>
      const SvgGenImage('assets/svg/platform cube.svg');

  /// List of all assets
  List<dynamic> get values => [
    aGitkeep,
    apple,
    copyIcon,
    googleSvg,
    logo,
    platformCube,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
