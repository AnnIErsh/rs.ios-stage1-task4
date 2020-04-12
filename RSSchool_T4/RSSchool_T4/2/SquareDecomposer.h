#import <Foundation/Foundation.h>

@interface SquareDecomposer : NSObject

@property (nonatomic) NSMutableArray *numbers;
@property (nonatomic) NSMutableArray *sums;

@property (nonatomic) NSArray *array;

- (BOOL)isNegative:(NSMutableArray*)arr;
- (void)refreshData;
- (BOOL)checkSums:(NSMutableArray*)arr withNumber:(NSNumber*)numb;
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number;

@end


