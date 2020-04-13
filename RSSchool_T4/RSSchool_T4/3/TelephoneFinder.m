#import "TelephoneFinder.h"

@implementation TelephoneFinder

- (BOOL)ifNotNumber:(NSString*)str {
    
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([str rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        return YES;
    return NO;
}

-(void)refreshCallString {
    
    self.callstring = self.firstString.mutableCopy;
}

-(void)complectNumbers:(NSMutableArray*)numbs withString:(NSString*)str {
    
    if (numbs.count <= 0)
        return;
    NSString *key = [numbs lastObject];
    NSArray *array = [self.keypad objectForKey:key];
    
    for (NSString *s in array)
    {
        [self refreshCallString];
        [self.callstring replaceCharactersInRange:NSMakeRange(numbs.count - 1, 1) withString:s];
        [self.numbers addObject:self.callstring.copy];
    }
    
    str = [str substringToIndex:str.length - (str.length > 0)];
    [numbs removeLastObject];
    [self complectNumbers:numbs withString:str];
}

- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    if ([self ifNotNumber:number] == NO)
        return nil;
    
    self.firstString = number;
    self.numbers = @[].mutableCopy;
    self.callstring = number.mutableCopy;
    NSMutableArray *callMe = [NSMutableArray new];
    
    for (int i=0; i < number.length; i++) {
        NSString *ch  = [NSString stringWithFormat:@"%c", [number characterAtIndex:i]];
        [callMe addObject:ch];
    }
    
    NSLog(@"%@", callMe);
    
    self.keypad = @{@"1":@[@"2", @"4"],
                    @"2":@[@"1", @"3", @"5"],
                    @"3":@[@"2", @"6"],
                    @"4":@[@"1", @"5", @"7"],
                    @"5":@[@"2", @"4", @"6", @"8"],
                    @"6":@[@"3", @"5", @"9"],
                    @"7":@[@"4", @"8"],
                    @"8":@[@"0", @"5", @"7", @"9"],
                    @"9":@[@"6", @"8"],
                    @"0":@[@"8"]};
    
    NSArray *values = [self.keypad objectForKey:number];
    
    if (number.length == 1)
        return values;
    
    [self complectNumbers:callMe withString:number.mutableCopy];
    return self.numbers.copy;
}

@end
