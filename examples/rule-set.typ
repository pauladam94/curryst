#import "../curryst.typ": rule, prooftree
#set document(date: none)
#set page(width: 500pt, height: auto, margin: 0.5cm, fill: white)

#let tree = prooftree(rule(
  label: [Label],
  name: [Rule name],
  [Conclusion],
  [Premise 1],
  [Premise 2],
  [Premise 3],
))
#let ax = prooftree(rule(
  label: [Axiome],
  $Gamma tack A or not A$,
))
#let rule-set(..rules, spacing: 3em) = {
  block(rules.pos().map(box).join(h(spacing, weak: true)))
}
#align(center, rule-set(tree, ax, tree, tree, ax, ax, ax, ax))
