#import <Foundation/Foundation.h>

@interface FullBinaryTrees : NSObject

@property (nonatomic, strong) NSMutableArray *arrays;
@property (nonatomic, strong) NSMutableArray *nodes;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, strong) NSMutableArray *results;
- (NSString *)stringForNodeCount:(NSInteger)count;

@end
