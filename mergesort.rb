#Merge Sort (divides input array in two halves, calls itself for the two halves and then merges the two sorted halves recursively)
#Time-complexity: O(nlogn),Auxiliary Space: O(n),Stable
#Algorithmic Paradigm: Divide and Conquer
#Uses: Sorting linked lists(implementation details differ), Counting inversions in array

#merge_sort(arr, l,  r)
    #If r > l
    #    1. Find the middle point to divide the array into two halves:
    #             middle m = (l+r)/2
    #     2. Call mergeSort for first half:
    #           Call mergeSort(arr, l, m)
    #     3. Call mergeSort for second half:
    #            Call mergeSort(arr, m+1, r)
    #    4. Merge the two halves sorted in step 2 and 3:
    #            Call merge(arr, l, m, r)


def merge_sort(arr)
  if arr.length <= 1
    arr
  else
    mid = (arr.length / 2).floor
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end


arr = [3,4,2,1,8,6,9,7,5]

merge_sort(arr)
