#!/usr/bin/awk -f

BEGIN {
  shape["A"]=shape["X"]=1	# Rock
  shape["B"]=shape["Y"]=2	# Paper
  shape["C"]=shape["Z"]=3	# Scissors
  score1=0
  score2=0
}

NF==2 {
  score1 += shape[$2]
}

/^(A X|B Y|C Z)$/ {
  score1+=3
}

/^(A Y|B Z|C X)$/ { score1+=6 }

/^. X$/ { score2+=(shape[$1]+2) % 4; score2+=shape[$1] > 1 ? 1 : 0 }
/^. Y$/ { score2+=3 + shape[$1] }
/^. Z$/ { score2+=6 + (shape[$1] % 3) + 1 }

END{ print score1; print score2 }
