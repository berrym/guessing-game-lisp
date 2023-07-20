;;; Commentary:
;;;guessing-game.lisp --- Guess the secret number!

;; Copyright (c) 2023 Michael Berry

;; Author: Michael Berry <trismegustis@gmail.com>
;; URL: https://github.com/berrym/guessing-game-lisp

;; License: MIT

;;; Code:

(defun guess-the-secret-number (&optional (min 1) (max 100) (attempts 10))
  "Play guess the secret number."
  (let ((secret-number (+ (random (1+ (- max min))) min))
        (guess nil))
    (format t "Try to guess a number from ~d to ~d!~%" min max)
    (format t "You have ~d attempts to guess the correct number.~%" attempts)
    (loop do (format t "~d> " attempts)
             (setf guess (read))
             (cond ((not (integerp guess))
                    (format t "Invalid guess!~%"))
                   ((< guess secret-number)
                    (format t "Too small!~%")
                    (decf attempts))
                   ((> guess secret-number)
                    (format t "Too high!~%")
                    (decf attempts)))
          until (or (= attempts 0) (and (integerp guess) (= guess secret-number))))
    (if (> attempts 0)
        (format t "You win! The secret number was ~d.~%" secret-number)
        (format t "You lost! The secret number was ~d.~%" secret-number)))
  (format t "Thanks for playing!~%"))

(guess-the-secret-number)

;;; guessing-game.lisp ends here
