#import "LevelOrderTraversal.h"

NSUInteger Integer(NSArray *treeArray, NSMutableArray *levelOrdered, NSUInteger level, NSUInteger startIndex)
{
    typedef enum
    {
        Left,
        Right
    }
    Order;
    
    NSUInteger index = startIndex;
    for (Order nodeType = Left; nodeType <= Right && index < treeArray.count; ++nodeType)
    {
        NSObject *object = treeArray[index++];
        if ([object isKindOfClass:NSNumber.class])
        {
            if (levelOrdered.count <= level)
            {
                [levelOrdered addObject:[NSMutableArray new]];
            }
            [levelOrdered[level] addObject:object];
            index = Integer(treeArray, levelOrdered, level+1, index);
        }
    }
    return index;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree)
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        NSUInteger level = 0;
        Integer(tree, resultArray, level, 0);
        return [resultArray copy];
}
