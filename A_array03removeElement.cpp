#include <iostream>
#include <sstream>
#include <stdio.h>
#include <vector>
using namespace std;

int main()
{
    cout << "num" << endl;
    int num;
    cin >> num;
    cout << "nums" << endl;
    vector<int> nums(num);
    for(int i = 0; i < nums.size(); i++) {
        cin >> nums[i];
    }
    cout << "target" << endl;
    int target;
    cin >> target;

    // // 这个是暴力循环方法 复杂度是o(n^2)
    // for (int i = 0; i < num; i++){
    //     if(nums[i] == target){
    //         for (int j = i+1; j < num; j++){ // 这里是i+1呀，+1不要写掉了
    //             nums[j - 1] = nums[j];
    //         }
    //         i--;
    //         num--;
    //     }
    // }
    // cout << "num" << endl << num <<endl;
    // cout << "nums" << endl;
    // for(int i = 0; i < num; i++) {
    //     cout << nums[i];
    // }

    // 双指针的方法 复杂度是o(n)
    int slowIndex = 0;
    for (int fastIndex = 0; fastIndex < nums.size(); fastIndex++){
        if (target != nums[fastIndex]){
            nums[slowIndex] = nums[fastIndex];
            slowIndex++;
        }
    }
    cout << "slowIndex" << endl << slowIndex <<endl;
    cout << "nums" << endl;
    for(int i = 0; i < slowIndex; i++) {
        cout << nums[i];
    }

    return 0;
}
