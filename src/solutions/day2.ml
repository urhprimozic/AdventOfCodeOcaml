(* > algebruh *)
open Utils.Signature
open Utils.List_utils

module Solver : Solver = struct
  (*Stevilo ponovitev chr 0 pass pove, kolkrat se chr pojavi v stringu pass*)
  let rec stevilo_ponovitev chr index pass =
    let dolzina = String.length pass in
    if index >= dolzina then 0
    else if pass.[index] = chr then 1 + stevilo_ponovitev chr (index + 1) pass
    else stevilo_ponovitev chr (index + 1) pass

  type podatki = { mini : int; maxi : int; pass : string; chr : char }

  let odpakiraj str =
    let temp = String.split_on_char ' ' str in
    let meje = List.nth temp 0 |> String.split_on_char '-' in
    let mini = int_of_string (List.nth meje 0) in
    let maxi = int_of_string (List.nth meje 1) in
    let pass = List.nth temp 2 in
    let chr = (List.nth temp 1).[0] in
    { mini; maxi; pass; chr }

  let preveri_geslo podatek =
    let data = odpakiraj podatek in
    let ponovitve = stevilo_ponovitev data.chr 0 data.pass in
    if data.mini <= ponovitve && data.maxi >= ponovitve then 1 else 0

  (* Sum je pobrana z neta ker se mi ne da*)
  let sum l =
    let rec aux acc = function [] -> acc | h :: t -> aux (acc + h) t in
    aux 0 l

  let naloga1 data =
    let lines = List.lines data in
    List.map preveri_geslo lines |> sum |> string_of_int

  let pravilno_preveri_geslo podatek =
    let data = odpakiraj podatek in
    let index_1 = data.mini in
    let index_2 = data.maxi in
    let pass = data.pass in
    let char_1 = pass.[index_1 - 1] in
    let char_2 = pass.[index_2 - 1] in
    if
      (char_1 = data.chr && char_2 != data.chr)
      || (char_2 = data.chr && char_1 != data.chr)
    then 1
    else 0

  let naloga2 data _part1 =
    let lines = List.lines data in
    List.map pravilno_preveri_geslo lines |> sum |> string_of_int
end
