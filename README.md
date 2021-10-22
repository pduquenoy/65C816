# 65C816
A homebrew computer based on the 65C816 processor

## Schematic

[![Schematic](./hardware/65C816.png)](./hardware/65C816.png)

## BOM

**Component Count:** 31

| Refs | Qty | Component | Description |
| ----- | --- | ---- | ----------- |
| C1 | 1 | 220u | Polarized capacitor, small symbol |
| C2, C3, C8 | 3 | 10u | Polarized capacitor, small symbol |
| C4, C5, C6, C7, C9, C10, C11, C12 | 8 | 100n | Unpolarized capacitor, small symbol |
| D1 | 1 | POWER | Light emitting diode, small symbol |
| D2 | 1 | 1N5817 | 20V 1A Schottky Barrier Rectifier Diode, DO-41 |
| J1 | 1 | POWER | Generic connector, single row, 01x02 |
| R1 | 1 | 220 | Resistor, small symbol |
| R2 | 1 | 1k | Resistor, small symbol |
| RN1, RN2, RN3, RN4, RN5, RN6 | 6 | 10k | 8 resistor network, star topology, bussed resistors, small symbol |
| U1 | 1 | 74AC00 | quad 2-input NAND gate |
| U2 | 1 | W65C816SxP | W65C816S 8/16-bit CMOS General Purpose Microprocessor, DIP-40 |
| U3 | 1 | 74ACT245 | Octal BUS Transceivers, 3-State outputs |
| U4 | 1 | 74AC573 | 8-bit Latch 3-state outputs |
| U5 | 1 | DS1035-10 | 3-in-1 High–Speed Silicon Delay Line |
| U6 | 1 | 74AC74 | Dual D Flip-flop, Set & Reset |
| U8 | 1 | 74AC11 | Triple 3-input AND |
| U9 | 1 | 74AC32 | Quad 2-input OR |

### Used in previous videos

| Refs | Qty | Component | Description |
| ----- | --- | ---- | ----------- |
| U* | 1 | 74AC04 | hex inverter |
| U* | 1 | 74AC08 | Quad And2 |

## Timing diagrams

### DB/BA Latch

<details><summary>View source</summary><p>

Uses [custom fork](https://github.com/adrienkohlbecker/wavedrom)

```js
{
  signal: [
    { name: 'CLK', wave: '1.0(50)1(50)0.', phase: 0.20 },
    { nodes: ['..Ѳ(10)Ѵ(40)Ά(10)Β', '...(7.5)Α(2.5)Γ(2.5)Ν(45)Ξ(2.5)Ο(2.5)Ό'], phase: 0.9 },
    { name: 'CLK+', wave: '1..(7.5)x(5)0(45)x(5)1..(37.5)', phase: 0.20 },
    { nodes: ['..B(33)Π', '..A(10)D(40)E(10)F(30)G(10)H'], phase: 0.9 },
    { name: 'CPU D0-D7 (read)', wave: '6..(10)x(23)7(27)x(30)6..(10)', data: ['Read Data', 'Bank Address', 'Read Data'], phase: 0.20 },
    { nodes: ['..K(33)C(17)Σ(30)I', '..Ρ(10)L(23)C(17)M(10)N'], phase: 0.9 },
    { name: 'CPU D0-D7 (write)', wave: '6(12)x(23)7(27)x(20)6(22)', data: ['Write Data', 'Bank Address', 'Write Data'], phase: 0.20 },
    { nodes: ['...(12.5)Я(8.5)P(29)Τ(7.5)S', '...(7.5)J(1)O..(39.5)Q(1)R'], phase: 0.9 },
    { name: 'AC573A LE', wave: '0..(8.5)x(12.5)1(30)x(6.5)0(44.5)', node: '..(49)É(3)È.(5.5)À(2)Ç', phase: 0.20, nphase: 0.9, nyoffset: -6 },
    { nodes: ['..(34)Υ(11.5)Z', '...(8.5)T(2)U(10.5)V(11)W(1)X(2)Y'], phase: 0.9 },
    { name: 'BA0-BA7', wave: '7..(10.5)x(21.5)=(3)x(9.5)7(57.5)', data: ['BA', 'Passthr.', 'Bank Address'], phase: 0.20 },
  ],
  edge: [
    'Ѳ+Ѵ 10ns', 'Α+Γ 2.5ns', 'Γ+Ν 2.5ns', 'Ά+Β 10ns', 'Ξ+Ο 2.5ns', 'Ο+Ό 2.5ns',
    'A+D 10ns', 'B+Π 33ns', 'E+F 10ns', 'G+H 10ns',
    'Ρ+L 10ns', 'K+C 33ns', 'M+N 10ns', 'Σ+I 30ns',
    'J+O 1ns', 'Я+P 8.5ns', 'Q+R 1ns', 'Τ+S 7.5ns',
    'T+U 2ns', 'V+W 11ns', 'X+Y 2ns', 'Υ+Z 11.5ns',
    'É+È 3ns', 'À+Ç 2ns',
  ],
  config: {
    skin: 'narrow_x4',
    hscale: 2,
    lines: {
      offset: 2,
      every: 50
    },
    background: 'white'
  },
  head: {
    tick: -2,
      every: 10,
        text: ['tspan', { "font-size": '12px', dx: 20 }, 'based on 10Mhz clock; assumes BE=RDY=1']
  }
}
```
</p></details>

[![DB/BA Latch](./timing/Timing%20Latch.png)](./timing/Timing%20Latch.png)

### DB/BA Buffer

<details><summary>View source</summary><p>

Uses [custom fork](https://github.com/adrienkohlbecker/wavedrom)

```js
{
  signal: [
    { name: 'CLK', wave: '1.0(50)1(50)0.', phase: 0.20 },
    { nodes: ['..Ѳ(10)Ѵ(40)Ά(10)Β', '...(7.5)Α(2.5)Γ(2.5)Ν(45)Ξ(2.5)Ο(2.5)Ό'], phase: 0.9 },
    { name: 'CLK+', wave: '1..(7.5)x(5)0(45)x(5)1..(37.5)', phase: 0.20 },
    { nodes: ['..B(33)Π', '..A(10)D(40)E(10)F(30)G(10)H'], phase: 0.9 },
    { name: 'CPU D0-D7 (read)', wave: '6..(10)x(23)7(27)x(30)6..(10)', data: ['Read Data', 'Bank Address', 'Read Data'], phase: 0.20 },
    { nodes: ['..K(33)C(17)Σ(30)I', '..Ρ(10)L(23)C(17)M(10)N'], phase: 0.9 },
    { name: 'CPU D0-D7 (write)', wave: '6(12)x(23)7(27)x(20)6(22)', data: ['Write Data', 'Bank Address', 'Write Data'], phase: 0.20 },
    { nodes: ['..Ύ(30)Д', '..Б(10)Г'], phase: 0.9 },
    { name: 'ACT245 DIR', wave: '3..(10)x(20)3(70)..', data: ['RWB', 'RWB'], phase: 0.20 },
    { node: '...(10)Ё(1)Ж(19)З(12)И', phase: 0.9 },
    { name: 'ACT245 OUT', wave: '2..(11)x(31)2(58)..', data: ['DIR valid', 'DIR valid'], phase: 0.20 },
    { nodes: ['...(11)(2.5)І(17)Л(21.5)(11)(2.5)Ѣ(15)Ц', '...(7.5)Й(2)К(41.5)(7.5)П(2)Ф'], phase: 0.9 },
    { name: 'ACT245 OE', wave: '0..(9.5)x(20)1(30)x(18)0(22.5)..', data: ['RWB', 'RWB'], phase: 0.20 },
    { node: '...(9.5)Ч(1)Ш(19)Щ(11)Ъ(19)Ы(1.5)Ь(16.5)Э(12)Ю', phase: 0.9 },
    { name: 'ACT245 OUT', wave: '2..(10.5)x(30)2(20.5)x(28.5)2(10.5)..', data: ['ON', 'OFF', 'ON'], phase: 0.20 },
    { nodes: ['..Ε(10)Δ', '..(10)Φ(1)Έ(71)Ζ(9)Η(10)Ή'], phase: 0.9 },
    { name: 'D0-D7 (read)', wave: '6..(9)x(72)6(19)..', data: ['Read Data', 'Read Data'], phase: 0.20 },
    { node: '..Θ(10)Ι(1)Ί(39)Κ(30)Λ(9)Μ', phase: 0.9 },
    { name: 'D0-D7 (write)', wave: '6..(11)x(78)6(11)..', data: ['Write Data', 'Write Data'], phase: 0.20 },
  ],
  edge: [
    'Ѳ+Ѵ 10ns', 'Α+Γ 2.5ns', 'Γ+Ν 2.5ns', 'Ά+Β 10ns', 'Ξ+Ο 2.5ns', 'Ο+Ό 2.5ns',
    'A+D 10ns', 'B+Π 33ns', 'E+F 10ns', 'G+H 10ns',
    'Ρ+L 10ns', 'K+C 33ns', 'M+N 10ns', 'Σ+I 30ns',
    'Б+Г 10ns', 'Ύ+Д 30ns',
    'Ё+Ж 1ns', 'З+И 12ns',
    'Й+К 2ns', 'І+Л 17ns', 'П+Ф 2ns', 'Ѣ+Ц 15ns',
    'Ч+Ш 1ns', 'Щ+Ъ 11ns', 'Ы+Ь 1.5ns', 'Э+Ю 12ns',
    'Ε+Δ 10ns', 'Φ+Έ 1ns', 'Ζ+Η 9ns', 'Η+Ή 10ns',
    'Θ+Ι 10ns', 'Ι+Ί 1ns', 'Κ+Λ 30ns', 'Λ+Μ 9ns'
  ],
  config: {
    skin: 'narrow_x4',
    hscale: 2,
    lines: {
      offset: 2,
      every: 50
    },
    background: 'white'
  },
  head: {
    tick: -2,
      every: 10,
        text: ['tspan', { "font-size": '12px', dx: 20 }, 'based on 10Mhz clock; assumes BE=RDY=1']
  }
}
```
</p></details>

[![DB/BA Buffer](./timing/Timing%20Buffer.png)](./timing/Timing%20Buffer.png)

### Bus Enable

<details><summary>View source</summary><p>

Uses [custom fork](https://github.com/adrienkohlbecker/wavedrom)

```js
{
  signal: [
    { name: 'BE', wave: '1....0(32)', phase: 0.20 },
    { nodes: ['.....Ѳ(25)Ѵ'], phase: 0.90 },
    { name: 'CPU ADDR & RWB', wave: '7....x(25)9(7)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['.....Ά(8.5)Ν', '.....Α(1.5)Γ'], phase: 0.90 },
    { name: 'AC573 OE', wave: '0.....(1.5)x(7)1(23.5)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['......(8.5)Β(12)Ξ', '......(1.5)Ο(2)Ό'], phase: 0.90 },
    { name: 'AC573 OUT', wave: '7.....(3.5)x(17)9(11.5)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['.....A(17)D', '.....B(2.5)Π'], phase: 0.90 },
    { name: 'ACT245 OE', wave: '0.....(2.5)x(14.5)1(15)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['......(17)E(11)F', '......(2.5)G(1)H'], phase: 0.90 },
    { name: 'ACT245 OUT', wave: '7.....(3.5)x(24.5)9(4)', data:['ON', 'OFF'], phase: 0.20 },
    {},
    {},
    { name: 'BE', wave: '0....1(32)', phase: 0.20 },
    { nodes: ['.....Ρ(25)L'], phase: 0.90 },
    { name: 'CPU ADDR & RWB', wave: '9....x(25)7(7)', data:['OFF', 'ON'], phase: 0.20 },
    { nodes: ['.....M(7)N', '.....K(1)C'], phase: 0.90 },
    { name: 'AC573 OE', wave: '1.....(1)x(6)0(25)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['......(7)J(10)O', '......(1)Σ(2)I'], phase: 0.90 },
    { name: 'AC573 OUT', wave: '9.....(3)x(14)7(15)', data:['OFF', 'ON'], phase: 0.20 },
    { nodes: ['.....Q(14.5)R', '.....Я(2)P'], phase: 0.90 },
    { name: 'ACT245 OE', wave: '1.....(2)x(12.5)0(17.5)', data:['ON', 'OFF'], phase: 0.20 },
    { nodes: ['......(14.5)T(12)U', '......(2)Τ(1.5)S'], phase: 0.90 },
    { name: 'ACT245 OUT', wave: '9.....(3.5)x(23)7(5.5)', data:['OFF', 'ON'], phase: 0.20 },
  ],
  edge: [
    'Ѳ+Ѵ 25ns', 'Α+Γ 1.5ns', 'Ά+Ν 8.5ns', 'Ο+Ό 2ns', 'Ξ+Β 12ns',
    'B+Π 2.5ns', 'A+D 17ns', 'G+H 1ns','E+F 11ns',
    'Ρ+L 25ns', 'K+C 1ns', 'M+N 7ns', 'Σ+I 2ns', 'J+O 10ns',
    'Я+P 2ns', 'Q+R 14.5ns', 'Τ+S 1.5ns','T+U 12ns',
  ],
  config: {
    skin: 'narrow_x4',
    hscale: 2,
    lines: {
      offset: 5,
      every: 50
    },
    background: 'white'
  },
  head: {
    tick: -5,
      every: 10,
        text: ['tspan', { "font-size": '12px', dx: 20 }, 'timing of Bus Enable; assumes CLK=RDY=1']
  }
}
```
</p></details>

<a href="./timing/Timing%20BE.png"><img src="./timing/Timing%20BE.png" width="330"/></a>
