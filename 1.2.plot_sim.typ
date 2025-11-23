#import "@preview/lilaq:0.5.0" as lq

#let (_, vd_z, i_z) = lq.load-txt(read("assets/ZD3V9_sim.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd_st, i_st) = lq.load-txt(read("assets/BAT41_sim.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd_si, i_si) = lq.load-txt(read("assets/1N4148_sim.txt"), delimiter: "\t", skip-rows: 1)

#let i_si = i_si.map(v => v * 1000)
#let i_st = i_st.map(v => v * 1000)
#let i_z = i_z.map(v => v * 1000)


#show: lq.theme.skyline

#figure(caption: "Simulated IV-Curves of all three Diodes")[
  #lq.diagram(
    width: 100%,
    height: 33%,
    // title: [],
    xlabel: [*Voltage Drop* [V]],
    ylabel: [*Current* [mA]],
    legend: (position: left + top),
    xlim: (-5, 1),
    // ylim: (-0006.5, 0022.2),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(20%).transparentize(20%), dash: "solid", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
    ),


    lq.plot(vd_st, i_st, mark: ".", label: [BAT41 #h(1pt) (Schottky Diode)], mark-size: 0pt),
    lq.plot(vd_si, i_si, mark: ".", label: [1N4148 (Si Diode)], mark-size: 0pt),
    lq.plot(vd_z, i_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  )
] <figure2>
