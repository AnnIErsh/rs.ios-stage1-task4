#import "ArrayCalculator.h"

@implementation ArrayCalculator

+ (NSMutableArray*)multElements:(NSMutableArray*)arr {
    NSMutableArray *results = @[@1].mutableCopy;
    int k = 0;
    for (int i = 0; i < arr.count; i++)
    {
        k = [results[i] intValue] * [arr[i] intValue];
        [results insertObject:@(k) atIndex:i + 1];
    }
    return results;
}

+ (BOOL)ifNotNumber:(NSArray*)arr
{
    int k = 0;
    for (id i in arr)
    {
        if ([i isKindOfClass:[NSNumber class]])
            k++;
    }
    if (k == arr.count)
        return YES;
    return NO;
}

+ (NSInteger)getSum:(NSArray*)arr {
    NSInteger sum = 0;
    for (id i in arr)
    {
        if ([i isKindOfClass:[NSNumber class]])
            sum += [i integerValue];
    }
    
    return sum;
}

+ (NSInteger)getMult:(NSArray*)arr {
    NSInteger mult = 1;
    int count = 0;
    for (id i in arr)
    {
        if ([i isKindOfClass:[NSNumber class]])
        {
            mult *= [i integerValue];
            count++;
        }
    
    }
    if (count == 0)
        return 0;
    return mult;
}


+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    if ([self ifNotNumber:array] == NO)
        return [self getMult:array];
    if (numberOfItems > array.count)
        return [self getSum:array];
    if (numberOfItems == array.count)
        return [self getMult:array];
    NSMutableArray *positives = [NSMutableArray new];
    NSMutableArray *negatives = [NSMutableArray new];
    for (NSNumber *n in array)
    {
        if (n.intValue > 0)
            [positives addObject:n];
        if (n.intValue <= 0)
            [negatives addObject:n];
    }
    
    [positives sortUsingSelector:@selector(compare:)];
    positives = [[positives reverseObjectEnumerator] allObjects].mutableCopy;
    [negatives sortUsingSelector:@selector(compare:)];
    
    positives = [self multElements:positives].mutableCopy;
    negatives = [self multElements:negatives].mutableCopy;
    NSInteger p = numberOfItems - positives.count;
    
    if (positives.count <= numberOfItems)
    {
        for (int i = 0; i <= p; i++)
            [positives addObject:@(0)];
    }
    NSInteger res = 0;
    for (NSNumber *i in negatives)
    {
        if (i.intValue > 1)
        {
            res = [positives[numberOfItems - 2] intValue] * i.intValue;
            if (res > [positives[numberOfItems] intValue])
                break;
            else
            {
                res = [positives[numberOfItems] intValue];
                break;
            }
        }
        else
        {
            res = [positives[numberOfItems] intValue];
        }
    }
    
    return res;
}
@end
