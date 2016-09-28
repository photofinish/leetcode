=begin
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  m = nums1.length
  n = nums2.length
  l = m+n
  if l%2 == 1
    find(nums1[0...m],nums2[0...n],l/2+1)
  else
    (find(nums1[0...m],nums2[0...n],l/2).to_f+find(nums1[0...m],nums2[0...n],l/2+1).to_f)/2
  end
end

# 在num1+num2数组中寻找排名为k的数 [2,4],[1,3,5],3
def find(nums1,nums2,k)
  return find(nums2,nums1,k) if nums2.length < nums1.length
  return nums2[k-1] if nums1.length == 0
  return min(nums1[0], nums2[0]) if k == 1
  i = min(k/2 , nums1.length) #1
  j = k - i #1
  if nums1[i - 1] < nums2[j - 1]
    return find nums1[i...nums1.length],nums2[0...nums2.length],k-i #[],[1,3]
  elsif nums1[i - 1] > nums2[j - 1]
    return find nums1[0...nums1.length],nums2[j...nums2.length],k-j
  else
    return nums1[i - 1]
  end
end

def min(a,b)
  if a > b
    b
  else
    a
  end
end