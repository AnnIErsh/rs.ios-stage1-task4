#import "FullBinaryTrees.h"

@implementation FullBinaryTrees

- (NSMutableArray <NSArray *> *)findAllCombinations:(NSMutableArray *)array withArr:(NSMutableArray *)beforeArr andArr:(NSMutableArray <NSArray *> *)combs {
    NSUInteger arr = [array count];
    if (arr == 0)
    {
        [combs addObject:beforeArr];
        return combs;
    }

    for (int i = 0; i < arr; i++)
    {
        NSMutableArray *newArray = [NSMutableArray arrayWithArray:array];
        [newArray removeObjectAtIndex:i];
        NSMutableArray *newArr = [NSMutableArray arrayWithArray:beforeArr];
        [newArr addObject:[array objectAtIndex:i]];
        [self findAllCombinations:newArray withArr:newArr andArr:combs];
    }

    return combs;
}

- (NSArray <NSArray *> *)redoArray:(NSArray *)array {
    return [self findAllCombinations:[NSMutableArray arrayWithArray:array] withArr:[NSMutableArray array] andArr:[NSMutableArray array]];
}

- (NSString *)stringForNodeCount:(NSInteger)count {
    
    if (count % 2 == 0)
        return @"[]";
    if (count == 1)
        return @"[[0]]";
    
    self.nodes = [NSMutableArray new];
    self.str = [NSMutableString new];
    NSUInteger numb = (count - 3) / 2;
    NSString *nills = @"0,0";
    NSString *nulls = @"null,null";
    
    for (int i = 0; i < numb + numb; i++)
        [self.nodes addObject:nills];
    for (int i = 0; i < numb + numb; i++)
    {
        if (i % 2 == 0)
            [self.nodes replaceObjectAtIndex:i withObject:nulls];
    }
    
    self.str = [[self.nodes valueForKey:@"description"] componentsJoinedByString:@","];
    self.results = [NSMutableArray new];
    NSArray *arr = self.nodes.copy;
    NSArray <NSArray *> *arrs = [self redoArray:arr];
    self.arrays = arrs.mutableCopy;
    int j = 0;
    
    for (NSArray *a in arrs)
    {
        for (int i = 0; i < a.count; i++)
        {
            if (a.lastObject == nulls)
            {
                [[self.arrays objectAtIndex:j] removeLastObject];
            }
        }
        j++;
    }
    
    arrs = self.arrays.copy;
    
    for (NSArray *arr in arrs)
        [self.results addObject:[arr componentsJoinedByString:@","]];

    NSArray *strs = [self.results valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"%@", strs);
    NSMutableArray *res = [NSMutableArray new];
    NSMutableString *newStr = @"[0,0,0,".mutableCopy;
    
    
    for (NSString *s in strs)
    {
        [newStr appendString:s];
        [newStr appendString:@"]"];
        [res addObject:newStr];
        newStr = @"[0,0,0,".mutableCopy;
    }
    
    self.str = [[res valueForKey:@"description"] componentsJoinedByString:@","];
    return self.str;
}
@end
