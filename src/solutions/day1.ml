(*Obstoj je boleč *)
open Utils.Signature
open Utils.List_utils

module Solver : Solver = struct
  let rec poisci_razliko_do_2020 (sestevanec : int) = function
    | [] -> None
    | x :: xs ->
        if x + sestevanec = 2020 then Some x
        else poisci_razliko_do_2020 sestevanec xs

  let rec vrni_zmnozek = function
    | [] -> None (*To se ne bi smelo zgoditi*)
    | x :: xs -> (
        let ans = poisci_razliko_do_2020 x xs in
        match ans with None -> vrni_zmnozek xs | Some y -> Some (x * y) )

  let int_of_option = function None -> 0 | Some x -> x

  let naloga1 data =
    let lines = List.lines data in
    lines |> List.int_list |> vrni_zmnozek |> int_of_option |> string_of_int

  (*Ideja: Zdaj loopamo čez x:xs in še enkrat loopamo čez xs *)
  let rec poisci_drugega x = function
    | [] -> None
    | y :: ys -> (
        let ans = poisci_razliko_do_2020 (x + y) ys in
        match ans with None -> poisci_drugega x ys | Some z -> Some (x * y * z)
        )

  let rec vrni_trojcka = function
    | [] -> None (*NE bi smel *)
    | x :: xs -> (
        let ans = poisci_drugega x xs in
        match ans with None -> vrni_trojcka xs | Some produkt -> Some produkt )

  let naloga2 data _part1 =
    let lines = List.lines data in
    lines |> List.int_list |> vrni_trojcka |> int_of_option |> string_of_int
end
