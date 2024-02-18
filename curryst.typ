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
  ccl: conclusion,
  prem: premises.pos()
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
) = {
  /// Returns a dictionary containing a laid out tree, as well as additional
  /// information.
  ///
  /// - `content` is the laid out tree.
  /// - `left-blank` is the offset of the start of the trunc of the tree, from
  ///   the left of the bounding box of the returned content.
  /// - `right-blank` is the offset of the end of the trunc of the tree, from
  ///   the right of the bounding box of the returned content.
  let layout(styles, rule) = {
    let prem = rule.prem.map(r => if type(r) == dictionary {
      layout(styles, r)
    } else {
      (
        left-blank: 0,
        right-blank: 0,
        content: box(inset: (x: title-inset), r),
      )
    })
    let prem-content = prem.map(p => p.content)

    let number-prem = prem.len()
    let top = stack(dir: ltr, ..prem-content)
    let name = rule.name
    let ccl = box(inset: (x: title-inset), rule.ccl)

    let top-size = measure(top, styles).width.pt()
    let ccl-size = measure(ccl, styles).width.pt()
    let total-size = calc.max(top-size, ccl-size)
    let name-size = measure(name, styles).width.pt()

    let complete-size = total-size * 1pt + name-size * 1pt + title-inset

    let left-blank = 0
    let right-blank = 0
    if number-prem >= 1 {
      left-blank = prem.at(0).left-blank
      right-blank = prem.at(-1).right-blank
    }
    let prem-spacing = 0pt
    if number-prem >= 1 {
      // Same spacing between all premisses
      prem-spacing = calc.max(prem-min-spacing, (total-size - top-size) / (number-prem + 1) * 1pt)
    }
    let top = stack(dir: ltr, spacing: prem-spacing, ..prem-content)
    top-size = measure(top, styles).width.pt()
    total-size = calc.max(top-size, ccl-size)
    complete-size = total-size * 1pt + name-size * 1pt + title-inset

    if ccl-size > total-size - left-blank - right-blank {
      let d = (total-size - left-blank - right-blank - ccl-size) / 2
      left-blank += d
      right-blank += d
    }
    let line-size = calc.max(total-size - left-blank - right-blank, ccl-size)
    let blank-size = (line-size - ccl-size) / 2

    let top-height = measure(top, styles).height.pt()
    let ccl-height = measure(ccl, styles).height.pt()

    let content = block(
      // stroke: red + 0.3pt, // DEBUG
      width: complete-size,
      stack(
        spacing: horizontal-spacing,

        // Lay out top.
        {
          let alignment = left
          // Maybe a fix for having center premisses with big trees
          // let alignment = center
          // If there are only one premisses
          // if top-height <= 1.5 * ccl-height {
          //  alignment = left
          // }
          set align(alignment)
          block(
            // stroke: green + 0.3pt, // DEBUG
            width: total-size * 1pt,
            align(center + bottom, top),
          )
        },

        // Lay out bar.
        {
          set align(left + horizon)
          box(
            // stroke: red + 0.3pt, // DEBUG
            inset: (bottom: {
              if (name == none) { 0.2em } else { 0.05em }
            }),
            stack(
              dir: ltr,
              h(left-blank * 1pt),
              line(start: (0pt, 2pt), length: line-size * 1pt, stroke: stroke),
              if (name != none) { h(title-inset) },
              name,
            ),
          )
        },

        // Lay out conclusion.
        {
          set align(left)
          stack(
            dir: ltr,
            h(left-blank * 1pt),
            block(
              // stroke: blue + 0.3pt, // DEBUG
              width: line-size * 1pt,
              align(center, ccl),
            )
          )
        },
      ),
    )

    return (
      left-blank: blank-size + left-blank,
      right-blank: blank-size + right-blank,
      content: content,
    )
  }

  style(styles => {
    box(
      // stroke : black + 0.3pt, // DEBUG
      layout(styles, rule).content,
    )
  })
}
