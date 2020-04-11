#import <Foundation/Foundation.h>

@interface ArrayCalculator : NSObject
+ (NSMutableArray*)multElements:(NSMutableArray*)arr;
+ (BOOL)ifNotNumber:(NSArray*)arr;
+ (NSInteger)getSum:(NSArray*)arr;
+ (NSInteger)getMult:(NSArray*)arr;
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array;
@end


