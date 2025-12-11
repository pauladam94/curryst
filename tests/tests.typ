#import "../curryst.typ": prooftree, rule
#set document(date: none)
#set page(margin: 0.5cm, width: auto, height: auto)

#let test(width: auto, config: (:), ..args) = {
  for dir in (btt, ttb) {
    pagebreak(weak: true)
    block(
      stroke: 0.3pt + red,
      width: width,
      prooftree(dir: dir, rule(..args), ..config),
    )
  }
}

#test(
  [Conclusion],
)

#test(
  name: [Axiom],
  [Conclusion],
)

#test(
  label: [Label],
  name: [Axiom],
  [Conclusion],
)

#test(
  label: [Label],
  name: [Name],
  [Premise],
  [Long conclusion],
)

#test(
  label: [Label],
  name: [Name],
  [Long premise],
  [Conclusion],
)

#test(
  label: [Label],
  name: [Name],
  [Premise 1],
  [Premise 2],
  [Conclusion],
)

#test(
  label: [Label],
  name: [Name],
  [Prem. 1],
  [Prem. 2],
  [Very long conclusion],
)

#test(
  label: [Label],
  name: [Name],
  rule(
    [Hypothesis 1],
    [Prem. 1],
  ),
  [Prem. 2],
  [Very long conclusion],
)

#test(
  label: [Label],
  name: [Name],
  rule(
    label: [Other label],
    name: [Other name],
    [Hypothesis 1],
    [Prem. 1],
  ),
  [Prem. 2],
  [Very long conclusion],
)

#test(
  name: [Name],
  rule(
    [Hypothesis 1],
    [Prem. 1],
  ),
  rule(
    name: [Other name],
    [Hypothesis 2],
    [Prem. 2],
  ),
  [Very long conclusion],
)

#let ax(ccl) = rule(name: [ax], ccl)
#let and-el(p, ccl) = rule(name: $and_e^l$, p, ccl)
#let and-er(p, ccl) = rule(name: $and_e^r$, p, ccl)
#let impl-i(p, ccl) = rule(name: $attach(->, br: i)$, p, ccl)
#let impl-e(pi, p1, ccl) = rule(name: $attach(->, br: e)$, pi, p1, ccl)
#let not-i(p, ccl) = rule(name: $not_i$, p, ccl)
#let not-e(pf, pt, ccl) = rule(name: $not_e$, pf, pt, ccl)

#test(
  impl-i(
    not-i(
      not-e(
        impl-e(
          ax($Gamma tack p -> q$),
          and-el(
            ax($Gamma tack p and not q$),
            $Gamma tack p$,
          ),
          $Gamma tack q$,
        ),
        and-er(
          ax($Gamma tack p and not q$),
          $Gamma tack not q$,
        ),
        $p -> q, p and not q tack bot$,
      ),
      $p -> q tack not (p and not q)$,
    ),
    $tack (p -> q) -> not (p and not q)$,
  ),
  [Conclusion],
)

#test(
  [Premise],
  [Premise],
  [Premise],
  [This is a very wide conclusion, wider than all premises combined],
)

#test(
  rule(
    [Short],
    [Premise],
  ),
  rule(
    [Short],
    [Premise],
  ),
  rule(
    [Very long premise to a premise in a tree],
    [Premise],
  ),
  [Conclusion],
)

#test(
  rule(
    [Very long premise to a premise in a tree],
    [Premise],
  ),
  rule(
    [Short],
    [Premise],
  ),
  rule(
    [Short],
    [Premise],
  ),
  [Conclusion],
)

#let ax(ccl) = rule(name: "aaaaaaaa", ccl)
#let and-el(p, ccl) = rule(name: "aaaaaaaaaaaaaaaaaaaaaaaa", p, ccl)
#let and-er(p, ccl) = rule(name: "aaaaaaaa", p, ccl)
#let impl-i(p, ccl) = rule(name: "aaaaaaaa", p, ccl)
#let impl-e(pi, p1, ccl) = rule(name: "aaaaaaaaaaaaaaaaa", pi, p1, ccl)
#let not-i(p, ccl) = rule(name: "aaaaaaaa", p, ccl)
#let not-e(pf, pt, ccl) = rule(name: "aaaaaaaa", pf, pt, ccl)

#test(
  config: (min-premise-spacing: 8pt),
  impl-i(
    not-i(
      not-e(
        impl-e(
          ax($Gamma tack p -> q$),
          and-el(
            ax($Gamma tack p and not q$),
            $Gamma tack p$,
          ),
          $Gamma tack q$,
        ),
        and-er(
          ax($Gamma tack p and not q$),
          $Gamma tack not q$,
        ),
        $p -> q, p and not q tack bot$,
      ),
      $p -> q tack not (p and not q)$,
    ),
    $tack (p -> q) -> not (p and not q)$,
  ),
  [Conclusion],
)

#test(
  config: (stroke: stroke(paint: blue, thickness: 2pt, cap: "round", dash: "dashed")),
  name: [Name],
  [Premise],
  [Conclusion],
)

#test(
  config: (
    min-premise-spacing: 2cm,
    title-inset: 1cm,
    vertical-spacing: 0.2cm,
    min-bar-height: 0.3cm,
  ),
  name: [Name],
  rule(
    label: [Label 1],
    [Hypothesis 1],
    [Premise 1],
  ),
  rule(
    name: [Name 2],
    [Hypothesis 2],
    [Premise 2],
  ),
  rule(
    label: [Label 3],
    name: [Name 3],
    [Hypothesis 3],
    [Premise 3],
  ),
  [Conclusion],
)

#test(
  config: (
    min-premise-spacing: 0pt,
    title-inset: 0pt,
    vertical-spacing: 0pt,
    min-bar-height: 0pt,
  ),
  name: [Name],
  rule(
    label: [Label 1],
    [Hypothesis 1],
    [Premise 1],
  ),
  rule(
    name: [Name 2],
    [Hypothesis 2],
    [Premise 2],
  ),
  rule(
    label: [Label 3],
    name: [Name 3],
    [Hypothesis 3],
    [Premise 3],
  ),
  [Conclusion],
)

// Test leafs are shown on multiple lines when appropriate.

#test(
  width: 5cm,
  name: $or_e$,
  $Gamma tack phi_1 or phi_2$,
  $Gamma, phi_1 tack psi$,
  $Gamma, phi_2 tack psi$,
  $Gamma tack psi$,
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
  ),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion],
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
  ),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion is a bit wide],
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
  ),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion is hugely wide!!!],
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0pt,
  ),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion],
)

#test(
  width: 8cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0.5cm,
  ),
  name: rect(width: 0.5cm),
  label: rect(width: 0.5cm),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion],
)

#test(
  width: 7.9cm,
  config: (
    min-premise-spacing: 1cm,
    title-inset: 0.5cm,
  ),
  name: rect(width: 0.5cm),
  label: rect(width: 0.5cm),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion],
)

#{
  // This test triggers a very specific issue. I can't find a way to reproduce
  // it without using Libertinus Serif as the font.
  // The issue is that rules are incorrectly laid out vertically due to rounding
  // errors. Note that, for this test to work, the container in the `test`
  // function should be a `block` and not a `box`.
  set text(font: "Libertinus Serif")
  test(
    name: [......................],
    [................],
    [................],
    [...],
  )
}

#test(
  [Premise],
  [Another premise.],
  [This is a very wide conclusion, wider than all premises combined],
)

#test(
  rule(
    [Very, very wide hypothesis...],
    [Premise],
  ),
  [Another premise.],
  [This is a very wide conclusion, wider than all premises combined],
)

#test(
  rule(
    [Hyyyyyyyyyyyyyyyyyyypothesis],
    [Premise],
  ),
  rule(
    [Hyyyyyyyyyyyyyyyyyyypothesis as well],
    [Premise],
  ),
  [This is a very wide conclusion, wider than all premises combined],
)

#test(
  rule(
    [Hyyyyyyyyyyyyyyyyyyypothesis],
    [Premise],
  ),
  rule(
    [Hyyyyyyyyyyyyyyyyyyypothesis as well],
    [Premise],
  ),
  [This is a wide conclusion, but not the widest],
)

#test(
  width: 5cm,
  config: (
    min-premise-spacing: 1cm,
    vertical-premise-spacing: 2em,
  ),
  rect(width: 1cm),
  rect(width: 1cm),
  rect(width: 1cm),
  [The conclusion],
)
