#import "@preview/lilaq:0.5.0" as lq

#let (t0, vr0, vi0) = lq.load-txt(read("assets/rectifier_real_onlyR.txt"), delimiter: "\t", skip-rows: 20)
#let (t1, vr1, vi1) = lq.load-txt(read("assets/rectifier_real_C1.txt"), delimiter: "\t", skip-rows: 20)
#let (t2, vr2, vi2) = lq.load-txt(read("assets/rectifier_real_C2.txt"), delimiter: "\t", skip-rows: 20)
#let (t3, vr3, vi3) = lq.load-txt(read("assets/rectifier_real_C3.txt"), delimiter: "\t", skip-rows: 20)

#let t0 = t0.map(v => v + 0.001)


#show: lq.theme.skyline

#figure(caption: "Measured Rectified Voltage")[
  #lq.diagram(
    width: 100%,
    height: 33%,
    // title: [],
    xlabel: [*$V_D$* [V]],
    ylabel: [*$I$* [mA]],
    legend: (position: left + top),
    // xlim: (-5, 1),
    // ylim: (-0006.5, 0022.2),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(20%).transparentize(20%), dash: "solid", thickness: .7pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: .7pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: .7pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: yellow.darken(20%), dash: "dotted", thickness: .7pt))
        it
      },
    ),


    lq.plot(t0, vi0, mark: ".", label: [Only R], mark-size: 0pt),
    lq.plot(t1, vi1, mark: ".", label: [2,2 #sym.mu F], mark-size: 0pt),
    lq.plot(t2, vi2, mark: ".", label: [22 #sym.mu F], mark-size: 0pt),
    lq.plot(t3, vi3, mark: ".", label: [220 #sym.mu F], mark-size: 1pt),
  )
] <figure4>
