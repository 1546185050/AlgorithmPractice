int cmp(const void  *a, const void  *b)
{
    return *(int *)a - *(int *)b;
}

//首先将数字从小到大排序，最小的数字一定在第一个位置，每个数字都需要在寻找到一个空位之后的下一个空位插入。如果寻找到了结尾，则返回开头继续寻找。
int* deckRevealedIncreasing(int* deck, int deckSize, int* returnSize) {
    *returnSize = deckSize;
    qsort(deck, deckSize, sizeof(deck[0]), cmp);
    int i = 0,
        n = 0,
        count = 1,
        *new_nums = (int *)malloc(deckSize*sizeof(deck));
    for (; i < deckSize; i++)
        new_nums[i] = -1;
    i = 0;
    new_nums[0] = deck[0];// 第一张卡牌特殊处理
    while (count < deckSize)
    {
        if (new_nums[n] == -1)
        {
            i++;
            if (i == 2)// 每隔 1 个有效位将卡牌依序放入
            {
                new_nums[n] = deck[count++];// 翻入新数组并计数
                i = 0;
            }
        }
        n++;
        if (n == deckSize)// 当 n 超出索引时置 0
            n = 0;
    }
    return new_nums;
}