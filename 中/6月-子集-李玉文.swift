
// 通过回溯法进行递归处理 回溯点为nums.count == 0
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        func backtrack(_ nums:[Int], temp:[Int]) {
            if nums.count == 0 {
                result.append(temp)
                return
            }
            
            for i in 0..<nums.count {
                //排除当前当前i
                let preArray = Array(nums.prefix(i))
                let sufArray = Array(nums.suffix(from: i + 1))
                backtrack(preArray + sufArray, temp: temp + [nums[i]])
            }
        }
        backtrack(nums, temp: temp)
        return result
    }
}
