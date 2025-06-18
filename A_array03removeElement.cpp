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

    for (int i = 0; i < num; i++){
        if(nums[i] == target){
            for (int j = i+1; j < num; j++){
                nums[j - 1] = nums[j];
            }
            i--;
            num--;
        }
    }
    cout << "num" << endl << num <<endl;
    cout << "nums" << endl;
    for(int i = 0; i < num; i++) {
        cout << nums[i];
    }

    return 0;
}
