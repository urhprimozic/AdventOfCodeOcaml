# Advent of code 2020

## Nasveti za uporabo

V datoteki `src/solutions/solution.ml` je definiran glavni program, ki sprejme številko dneva `X` prek ukazne vrstice, pokliče funkciji `naloga1`, `naloga2` definirani v modulu `src/dayX.ml` na vhodnih podatkih `data/day_X.in` in njuna rezultata izpiše na standardni izhod ter datoteki `out/day_X_1.out` in `out/day_X_2.out`.

Izhod, ki ga proizvede program šteje kot veljaven za dodatne točke.

Primer uporabe je tako za `opam`, kot brez njega podan za dan `0`, ki je rešitev prvega dneva iz leta 2019.

## Uporaba z nameščenim `opam`-om

Namestite si ukaz `make` in z opamom namestite `dune utop ocamlformat`. 

Rešitev dneva `X` najlažje podate tako, da v mapo `src/solutions/` dodate datoteko `dayX.ml`. V tej datoteki definirajte nov modul `Solver` in funkciji `naloga1` ter `naloga2`. Po želji si lahko definirate tudi pomožne funkcije. Če pa te funkcije pridejo v uporabo pogosteje, se vam jih splača definirati kje v `utils`, kot so recimo definirani `list_utils`.

V datoteki `solution.ml` dodajte nov vzorec v funkcijo `choose_solver`. Vhodne podatke zapišite v datoteko `data/day_X.in`.

Program sedaj poženete z `make run DAY=X`. Program bo prebral vsebino vhodne datoteke za dan X, pognal `naloga1` in `naloga2` ter njuna rezultata izpisal na tako na standardni izhod kot v ustrezni izhodni datoteki.

## Uporaba brez nameščenega `opam`-a (sistem windows brez dockerja)

V datoteki `project_windows` je že pripravljena koda za reševanje v eni sami datoteki. 

Za reševanje popravite funkcijo `choose_solver` in dodajte ustrezen modul `SolverX`.

Program poženite s popravljenim `task`-om iz repozitorija predmeta:
```
C:\\ ... bin\\ocaml.exe  \"${file}\" X"
```
Kjer je X številka dneva, ki ga rešujete.
