#import "../curryst.typ": rule, prooftree
#set document(date: none)
#set page(width: auto, height: auto, margin: 0.5cm, fill: white)

#let ax = rule.with(name: [ax])
#let and-el = rule.with(name: $and_e^ell$)
#let and-er = rule.with(name: $and_e^r$)
#let impl-i = rule.with(name: $scripts(->)_i$)
#let impl-e = rule.with(name: $scripts(->)_e$)
#let not-i = rule.with(name: $not_i$)
#let not-e = rule.with(name: $not_e$)

#prooftree(
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
        $ underbrace(p -> q\, p and not q, Gamma) tack bot $,
      ),
      $p -> q tack  not (p and not q)$,
    ),
    $tack (p -> q) -> not (p and not q)$,
  )
)
