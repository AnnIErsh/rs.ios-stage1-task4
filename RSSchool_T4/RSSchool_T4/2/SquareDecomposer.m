#import "SquareDecomposer.h"

@implementation SquareDecomposer


- (void)refreshData {
    
    [self.numbers removeLastObject];
    [self.sums removeLastObject];
}

- (void)squaredCheck:(NSNumber*)sum ofNumber:(NSNumber*)num {
    
    if (sum.intValue <= 0)
        return;
    else
    {

        num = @((int)sqrt(sum.intValue));
        
        if (self.numbers.count > 1)
        {
            if ([num isEqualToNumber:[self.numbers lastObject]] || (num.intValue > [[self.numbers lastObject] intValue]))
            {
               
                [self refreshData];
                num = @([[self.numbers lastObject] intValue] - 1);
                sum = @([[self.sums lastObject] intValue]);
                [self refreshData];
               // NSLog(@"++++");
            }
        }
        
        
        [self.numbers addObject:num];
        [self.sums addObject:sum];
    
        
        sum = @(sum.intValue - (num.intValue * num.intValue));
        [self squaredCheck:sum ofNumber:num];
    }
}

- (BOOL)isNegative:(NSMutableArray*)arr {
    
    for (NSNumber *i in arr)
    {
        if (i.intValue <= 0)
            return YES;
    }
    return NO;
}

- (BOOL)checkSums:(NSMutableArray*)arr withNumber:(NSNumber*)numb {
    
    NSMutableArray *array = arr;
    for (int i = 0; i < arr.count; i++)
    {
        [array replaceObjectAtIndex:i withObject:@([[array objectAtIndex:i] intValue] * [[array objectAtIndex:i] intValue])];
    }
    self.array = array.copy;
    NSNumber *sum = @([[self.array valueForKeyPath:@"@sum.self"] intValue]);
    if (sum.intValue == (numb.intValue * numb.intValue))
        return YES;
    return NO;
}

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
        
    self.numbers = @[].mutableCopy;
    self.sums = @[].mutableCopy;
    NSNumber *n = @(number.intValue - 1);
    NSNumber *sum = @(number.intValue * number.intValue - n.intValue * n.intValue);
    
    [self squaredCheck:sum ofNumber:n];
    [self.numbers insertObject:n atIndex:0];
    [self.numbers sortUsingSelector:@selector(compare:)];
    NSLog(@"%@", self.numbers);
    
    
    if ([self isNegative:self.numbers] || ![self checkSums:self.numbers.mutableCopy withNumber:number])
        return nil;
    return self.numbers.copy;
}
@end
