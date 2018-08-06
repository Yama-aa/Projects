# a challenge from hackerrank: https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem
import math


def binarysearch(a, x, left, right):
    middle = math.floor((left + right) / 2)
    if a[middle] == x:
        return middle
    elif right == left:
        if a[middle] > x:
            return middle + 1
        else:
            return middle
    elif a[middle] < x:
        return binarysearch(a, x, left, max(middle - 1, left))
    else:
        return binarysearch(a, x, min(middle + 1, right), right)


def climbing_leaderboard(scores_list, player_name):
    l = [scores_list[0]]
    for i in range(1, len(scores_list)):
        if len(scores_list) == 1:
            break
        elif scores_list[i] != scores_list[i - 1]:
            l.append(scores_list[i])
    k = []
    right = len(l) - 1
    for i in range(0, len(player_name)):
        index = binarysearch(l, player_name[i], 0, right)
        k.append(index + 1)
        right = max(index - 1, 0)
    return k


if __name__ == '__main__':
    scores = list(map(int, input("Please enter the leaderboard scores: space-separated integers in decreasing order").rstrip().split()))
    alice = list(map(int, input("Please enter the Alice's scores: space-separated integers in ascending order").rstrip().split()))
    result = climbing_leaderboard(scores, alice)
    print('\n'.join(map(str, result))+'\n')
