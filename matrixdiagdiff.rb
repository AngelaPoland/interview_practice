#Given a square matrix, calculate the absolute difference between the sums of its diagonals.

def diagdiff(arr)

  n = arr.length

  i = 0
  j = n-1

  leftdiag = 0
  rightdiag = 0

  n.times do
    leftdiag += arr[i][i]
    rightdiag += arr[j][i]
    i += 1
    j -= 1
  end

  return (leftdiag - rightdiag).abs


end

matrix = [[11,2,4],[4,5,6],[10,8,-12]] # should output 15

diagdiff(matrix)
