(* ali bo trpljenja sploh kdaj konec ? (plakat v kotečniku pod smerjo) *)
open Utils.Signature
open Utils.List_utils

module Solver : Solver = struct
  let vrednost = function '#' -> 1 | _ -> 0

  let sirina = 31 (* 31 *)

  let korak = 3

  let naslednji_index index = (index + korak) mod sirina

  let rec prestej_drevesa index = function
    | [] -> 0
    | vrsta :: ostanek ->
        vrednost vrsta.[index] + prestej_drevesa (naslednji_index index) ostanek

  let naloga1 data =
    let lines = List.lines data in
    string_of_int (prestej_drevesa 0 lines)

  let naloga2 data _part1 =
    let lines = List.lines data in
    string_of_int (prestej_drevesa 0 lines)
end
