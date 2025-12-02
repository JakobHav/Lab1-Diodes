#import "@preview/lilaq:0.5.0" as lq
#let (_, vi_z, vd_z) = lq.load-txt(read("assets/ZD3V9_real_neu.txt"), delimiter: "\t", skip-rows: 20)
#let (_, vi_st, vd_st) = lq.load-txt(read("assets/BAT41_real_neu.txt"), delimiter: "\t", skip-rows: 20)
#let (_, vi_si, vd_si) = lq.load-txt(read("assets/1N4148_real_neu.txt"), delimiter: "\t", skip-rows: 20)

#let i_z = ()

#for (vi, vd) in vi_z.zip(vd_z) {
  i_z.push(-1000 * (vi - vd) / 200)
}

#let i_st = ()

#for (vi, vd) in vi_st.zip(vd_st) {
  i_st.push(1000 * (vi - vd) / 200)
}

#let i_si = ()

#for (vi, vd) in vi_si.zip(vd_si) {
  i_si.push(1000 * (vi - vd) / 200)
}

#let vd_z = vd_z.map(v => v * -1)

#show: lq.theme.skyline

#figure(caption: [Measured IV-Curves of all three Diodes #footnote[Zener Diode mirrored at (0, 0) for better visual]])[
  #lq.diagram(
    width: 80%,
    height: 27%,
    // title: [],
    xlabel: [*Voltage Drop* [V]],
    ylabel: [*Current* [mA]],
    legend: (position: left + top),
    xlim: (-5, 1),
    // ylim: (-0, 4),

    cycle: (
      it => {
        set lq.style(fill: red.darken(20%).transparentize(20%))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: green.darken(20%), stroke: (thickness: 1pt, dash: "dotted"))
        it
      },
    ),


    lq.plot(vd_st, i_st, mark: ".", label: [BAT41 #h(1pt) (Schottky Diode)], mark-size: 0pt),
    lq.plot(
      vd_si,
      i_si,
      stroke: (paint: blue.darken(20%), thickness: .7pt, dash: "dashed"),
      mark: ".",
      label: [1N4148 (Si Diode)],
      mark-size: 0pt,
    ),
    lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
] <figure4>
