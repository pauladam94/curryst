#import "../curryst.typ" : *

#set page(margin: 30pt, width: auto, height: auto)


#let examples(..args) = {
  grid(
    columns: (10cm, 10cm),
    gutter: 0.5cm,
    ..args
      .pos()
      .map(code => (
        {
          set align(horizon)
          set text(size: 0.8em)
          set raw(lang: "typ")
          show: block.with(
            width: 100%,
            inset: 1em,
            radius: 0.2em,
            fill: luma(90%)
          )
          code
        },
        {
          set align(horizon)
          show: block.with(
            width: 100%,
            radius: 0.2em,
            inset: 1em,
            stroke: 1pt + luma(80%),
          )
          eval(code.text, mode: "markup", scope: (
            rule: rule,
            proof-tree: proof-tree,
          ))
        }
      ))
      .flatten()
  )
}


#examples(
  ```
  #let r = rule(
    name: [Rule name],
    [Conclusion],
    [Premise 1],
    [Premise 2],
    [Premise 3]
  )

  #proof-tree(r)
  ```,

  ```
  Consider the following tree:
  $
    Pi quad = quad #proof-tree(rule(
      name: $top_i$,
      $top$,
    ))
  $
  $Pi$ constitutes a derivation of $top$.
  ```,

  ```
  #proof-tree(rule(
    name: $R$,
    $C_1 or C_2 or C_3$,
    rule(
      name: $A$,
      $C_1 or C_2 or L$,
      rule(
        $C_1 or L$,
        $Pi_1$,
      ),
    ),
    rule(
      $C_2 or overline(L)$,
      $Pi_2$,
    ),
  ))
  ```,

  ```
  #let ax = rule.with(name: [ax])
  #let and-el = rule.with(name: $and_e^ell$)
  #let and-er = rule.with(name: $and_e^r$)
  #let impl-i = rule.with(name: $scripts(->)_i$)
  #let impl-e = rule.with(name: $scripts(->)_e$)
  #let not-i = rule.with(name: $not_i$)
  #let not-e = rule.with(name: $not_e$)

  #proof-tree(
    impl-i(
      $tack (p -> q) -> not (p and not q)$,
      not-i(
        $p -> q tack  not (p and not q)$,
        not-e(
          $ underbrace(p -> q\, p and not q, Gamma) tack bot $,
          impl-e(
            $Gamma tack q$,
            ax($Gamma tack p -> q$),
            and-el(
              $Gamma tack p$,
              ax($Gamma tack p and not q$),
            ),
          ),
          and-er(
            $Gamma tack not q$,
            ax($Gamma tack p and not q$),
          ),
        ),
      ),
    )
  )
  ```,

  ```
  #let r = rule(
    name: [Rule],
    [Conclusion],
    [Premise],
  )

  #proof-tree(
    stroke: 3pt,
    r,
  )

  #proof-tree(
    stroke: 1pt + red,
    r,
  )

  #proof-tree(
    stroke: stroke(cap: "round", dash: "dashed", paint: blue),
    r,
  )
  ```,
)
