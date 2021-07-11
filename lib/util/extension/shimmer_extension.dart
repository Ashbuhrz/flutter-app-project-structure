part of 'extension.dart';

///
/// Extension Method for the [Shimmer Effect] Widget
///
extension ShimmerEffect on Widget {
  Widget applyShimmer(
      {bool enable = true, Color? baseColor, Color? highlightColor}) {
    if (enable) {
      return Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[300]!,
        highlightColor: highlightColor ?? Colors.grey[100]!,
        enabled: enable,
        child: this,
      );
    } else {
      return this;
    }
  }
}

extension AnimatedCol on Column {
  Widget animatedVertically() {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 300),
          childAnimationBuilder: (Widget widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

extension AnimatedRow on Row {
  Widget animatedHorizonatal() {
    return AnimationLimiter(
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 300),
          childAnimationBuilder: (Widget widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

extension AnimatedWidget on Widget {
  Widget fadeAnimatedVertical() {
    return AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 300),
        child: SlideAnimation(
          child: SlideAnimation(
              verticalOffset: 50.0, child: FadeInAnimation(child: this)),
        ));
  }

  Widget fadeAnimatedHorizontal() {
    return AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 300),
        child: SlideAnimation(
          child: SlideAnimation(
              horizontalOffset: 50.0, child: FadeInAnimation(child: this)),
        ));
  }
}