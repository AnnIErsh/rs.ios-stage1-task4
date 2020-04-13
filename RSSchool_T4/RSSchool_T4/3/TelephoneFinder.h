#import <Foundation/Foundation.h>

@interface TelephoneFinder : NSObject

@property (nonatomic, strong) NSMutableString *callstring;
@property (nonatomic, strong) NSString *firstString;
@property (nonatomic, strong) NSDictionary *keypad;
@property (nonatomic, strong) NSMutableArray *numbers;

-(void)refreshCallString;
- (BOOL)ifNotNumber:(NSString*)str;
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number;

@end

