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

    int left = 0;
    int right = nums.size(); //这里没有减一
    
    cout << "right:" << right <<endl;
    while (left<right){  //这里没有等于
        int middle = left + ((right-left)/2);
        cout << middle <<endl;
        if (nums[middle] > target){
            right = middle ; // 这里没有减一
            cout << "right:" << right <<endl;

        }
        else if (nums[middle]<target){
            left = middle + 1;
            cout << "left:" << left <<endl;
        }
        else {
            cout << "position:" << middle <<endl;
            return middle;
        }
    }
    int middle = -1;
    cout << "position:" << middle <<endl;
    return -1;
}