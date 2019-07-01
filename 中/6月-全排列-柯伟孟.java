/**
* 思路:1
* 取出第一个数，结果列表{[1]}
* 遍历[1],利用list.add(i,value)在结果集合[1]的各个位置插入第二个数
* 递归，直至最后一个数
*/
public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> tmplist = new ArrayList<>();
        List<Integer> list = new ArrayList<>();
        list.add(nums[0]);
        tmplist.add(list);
        List<List<Integer>> result = new ArrayList<>();
        BFS_track(result,tmplist,nums,1);
        return result;
}
    
private void BFS_track(List<List<Integer>> result, List<List<Integer>> tmplist,int[] nums, int index){
    if(index == nums.length){
        result.addAll(tmplist);    
        return ;
    }else{
        List<List<Integer>> newtmpList = new ArrayList<>(tmplist.size() * (index+1));
        int tmpNum = nums[index];
        for(List<Integer> subList : tmplist){
            for(int i=0; i<=subList.size(); i++){
                List<Integer> innerList = new LinkedList<>(subList);
                innerList.add(i,tmpNum);
                newtmpList.add(innerList);
            }
        }
        BFS_track(result, newtmpList, nums, index+1);
    }      
}