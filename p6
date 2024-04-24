import math
def minmax (curDepth, nodeIndex, maxTurn, scores, targetDepth):
    if (curDepth == targetDepth): 
        return scores[nodeIndex]
     
    if (maxTurn):
        return max(minmax(curDepth + 1, nodeIndex * 2, False, scores, targetDepth), 
                   minmax(curDepth + 1, nodeIndex * 2 + 1, False, scores, targetDepth))
     
    else:
        return min(minmax(curDepth + 1, nodeIndex * 2, True, scores, targetDepth), 
                   minmax(curDepth + 1, nodeIndex * 2 + 1, True, scores, targetDepth))
     
scores=[]
num=int(input("Enter number of leaf nodes: "))
treeDepth = math.log(num, 2)
print("No. of levels: ",treeDepth)
for i in range(0,num):
    a=int(input("Enter node value: "))
    scores.append(a)
print(scores)

print("The optimal value is : ", end = "")
print(minmax(0, 0, True, scores, treeDepth))
