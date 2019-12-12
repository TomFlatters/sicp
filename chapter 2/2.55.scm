(car ''abracadabra)

; quote is returned when the evaluator applies car to (quote (quote abracadabra)) giving the quote in the inner brackets

(car ''(+ 5 3))