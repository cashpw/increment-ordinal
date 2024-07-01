(require 'buttercup)
(require 'increment-ordinal)

(describe
    "increment-ordinal"
  (it "returns original unmodified string when it's not an ordinal number"
    (expect (string= (increment-ordinal "hello, world")
                     "hello, world")))
  (it "increments 1st to 2nd"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 2nd to 3rd"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 3rd to 4th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 4th to 5th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 5th to 6th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 6th to 7th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 7th to 8th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 8th to 9th"
    (expect (string= (increment-ordinal "1st")
                     "2nd")))
  (it "increments 9th to 10th"
    (expect (string= (increment-ordinal "1st")
                     "2nd"))))

(describe
    "increment-ordinals-in-string"
  (it "only modifies ordinals"
    (expect (string= (increment-ordinals-in-string
                      "1st place")
                     "2nd place")))
  (it "increments 1-9"
    (expect (string= (increment-ordinals-in-string
                      "1st 2nd 3rd 4th 5th 6th 7th 8th 9th")
                     "2nd 3rd 4th 5th 6th 7th 8th 9th 10th"))))
