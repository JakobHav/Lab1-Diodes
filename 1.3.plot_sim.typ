#import "@preview/lilaq:0.5.0" as lq

#let (t1, vr1, vi1) = lq.load-txt(read("assets/LED_green_fake.txt"), delimiter: "\t", skip-rows: 1)
#let (t2, vr2, vi2) = lq.load-txt(read("assets/LED_red_fake.txt"), delimiter: "\t", skip-rows: 1)
#let (t3, vr3, vi3) = lq.load-txt(read("assets/LED_yellow_fake.txt"), delimiter: "\t", skip-rows: 1)

// #let t1 = t1.map(v => (v - 0.000) * 1000 + 20)
// #let t2 = t2.map(v => (v + 0.0023) * 1000 + 20)
// #let t3 = t3.map(v => (v + 0.0035) * 1000 + 20)

#show: lq.theme.skyline

#figure(caption: "LED IV Curves")[
  #lq.diagram(
    width: 100%,
    height: 30%,
    // title: [],
    xlabel: [*Voltage Drop* [V]],
    ylabel: [*Current* [A]],
    legend: (position: left + top),
    xlim: (0, 3.5),
    // ylim: (-0006.5, 0022.2),

    cycle: (
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "solid", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(20%), dash: "dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: yellow.darken(10%), dash: "densely-dotted", thickness: 1pt))
        it
      },
    ),


    lq.plot(vr1, vi1, mark: ".", label: [Green LED], mark-size: 0pt),
    lq.plot(vr2, vi2, mark: ".", label: [Red LED], mark-size: 0pt),
    lq.plot(vr3, vi3, mark: ".", label: [Yellow LED], mark-size: 0pt),
  )
] <figure4>
