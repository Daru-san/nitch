import
  std/[strutils, osproc]

proc getNixPkgs*(): string =
  let
    count = osproc.execCmdEx("nix-store -qR ~/.nix-profile | cat ; nix-store -qR /run/current-system/sw | cat")[0]

  result = $(count.split("\n").len - 1)
