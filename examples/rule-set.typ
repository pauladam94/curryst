#import "../curryst.typ": prooftree, rule, rule-set
#set document(date: none)
#set page(width: 500pt, height: auto, margin: 0.5cm, fill: white)

#let variable = prooftree(rule(
  name: [Variable],
  $Gamma, x : A tack x : A$,
))
#let abstraction = prooftree(rule(
  name: [Abstraction],
  $Gamma, x: A tack P : B$,
  $Gamma tack lambda x . P : A => B$,
))

#let application = prooftree(rule(
  name: [Application],
  $Gamma tack P : A => B$,
  $Delta tack Q : B$,
  $Gamma, Delta tack P Q : B$,
))

#let weakening = prooftree(rule(
  name: [Weakening],
  $Gamma tack P : B$,
  $Gamma, x : A tack P : B$,
))

#let contraction = prooftree(rule(
  label: [Contraction],
  $Gamma, x : A, y : A tack P : B$,
  $Gamma, z : A tack P[x, y <- z]: B$,
))

#let exchange = prooftree(rule(
  label: [Exchange],
  $Gamma, x : A, y: B, Delta tack P : B$,
  $Gamma, y : B, x: A, Delta tack P : B$,
))

#align(center, rule-set(
  variable,
  abstraction,
  application,
  weakening,
  contraction,
  exchange
))
