#import "../curryst.typ": rule, prooftree
#set document(date: none)
#set page(width: auto, height: auto, margin: 0.5cm, fill: white)

#prooftree(
  rule(
    name: $R$,
    rule(
      name: $A$,
      rule(
        $Pi_1$,
        $C_1 or L$,
      ),
      $C_1 or C_2 or L$,
    ),
    rule(
      $Pi_2$,
      $C_2 or overline(L)$,
    ),
    $C_1 or C_2 or C_3$,
  )
)
