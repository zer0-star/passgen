import cligen
import random, strutils

const
  charactors = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  symbols = r"!""#$%&'()*+,-./[\]^_`:;<=>?@{|}~"


proc selectCharSet(default: string; digit, letter, alphaNum: bool): set[char] =
  if not digit and not letter and not alphaNum:
    var
      defSet: set[char] = {}
    for c in default:
      defSet.incl c
    return defSet
  elif digit and not letter and not alphaNum:
    return Digits
  elif not digit and letter and not alphaNum:
    return Letters
  elif not digit and not letter and alphaNum:
    return Digits + Letters
  else:
    raise newException(ValueError, "Do not set multiple charactor flag")


proc generate(length: int = 30
             ; charactors: string = charactors
             ; symbols: string = symbols
             ; digit = false
             ; letter = false
             ; alphaNum = false) =

  var pass = ""
  let charSet = selectCharSet(charactors & symbols, digit, letter, alphaNum)
  for i in 1..length:
    pass.add charSet.sample
  stdout.write pass

when isMainModule:
  randomize()
  dispatch(generate)
