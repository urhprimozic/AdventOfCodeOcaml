let rec stevilo_ponovitev chr index pass =
  let dolzina = String.length pass in
  if index >= dolzina then 0
  else if pass.[index] = chr then 1 + stevilo_ponovitev chr (index + 1) pass
  else stevilo_ponovitev chr (index + 1) pass

let test_str = "1-3 a: abcde"

let test_list = [ "1-3 a: abcde"; "1-3 b: cdefg"; "2-9 c: ccccccccc" ]

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

let sum l =
  let rec aux acc = function [] -> acc | h :: t -> aux (acc + h) t in
  aux 0 l
