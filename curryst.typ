/// Creates an inference rule.
///
/// You can render a rule created with this function using the `proof-tree`
/// function.
#let rule(
  /// The name of the rule, displayed on the right of the horizontal bar.
  name: none,
  /// The conclusion of the rule.
  conclusion,
  /// The premises of the rule. Might be other rules constructed with this
  /// function, or some content.
  ..premises
) = (
  name: name,
  conclusion: conclusion,
  premises: premises.pos()
)

/// Lays out a proof tree.
#let proof-tree(
  /// The rule to lay out.
  ///
  /// Such a rule can be constructed using the `rule` function.
  rule,
  /// The minimum amount of space between two premises.
  prem-min-spacing: 15pt,
  /// The amount width with which to extend the horizontal bar beyond the
  /// content. Also determines how far from the bar the rule name is displayed.
  title-inset: 2pt,
  /// The stroke to use for the horizontal bars.
  stroke: stroke(0.4pt),
  /// The space between the bottom of the bar and the conclusion, and between
  /// the top of the bar and the premises.
  ///
  /// Note that, in this case, "the bar" refers to the bounding box of the
  /// horizontal line and the rule name (if any).
  horizontal-spacing: 0pt,
  /// The minimum height of the box containing the horizontal bar.
  ///
  /// The height of this box is normally determined by the height of the rule
  /// name because it is the biggest element of the box. This setting lets you
  /// set a minimum height. The default is 0.8em, is higher than a single line
  /// of content, meaning all parts of the tree will align properly by default,
  /// even if some rules have no name (unless a rule is higher than a single
  /// line).
  min-bar-height: 0.8em,
) = {
  import "internals.typ": layout-tree

  context {
    let tree = layout-tree(
      rule,
      prem-min-spacing.to-absolute(),
      stroke,
      title-inset.to-absolute(),
      title-inset.to-absolute(),
      horizontal-spacing.to-absolute(),
      min-bar-height.to-absolute(),
    ).content

    block(
      // stroke : black + 0.3pt, // DEBUG
      ..measure(tree),
      tree,
    )
  }
}
