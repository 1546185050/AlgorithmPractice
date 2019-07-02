class Solution {
    /* 解题思路
     [1,2,3]入参
     步骤1 默认加入一个空[]
     步骤2 [1] 的结果是 [1] ,[] 可以看做是 1 + []的组合
     步骤3 [1,2] 的结果是 [1] ,[], [2], [1,2] 可以看做是由上一步的结果上 和 2进行组合
     以此类推
    **/
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        result.append(temp)
        var length = 0
        for i in 0..<nums.count {
            length = result.count
            for j in 0..<length{
                temp = result[j]
                temp.append(nums[i])
                result.append(temp)
            }
        }
        return result
    }
}
