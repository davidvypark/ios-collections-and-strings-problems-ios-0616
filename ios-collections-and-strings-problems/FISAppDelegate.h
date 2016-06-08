//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here!
 
 */

-(NSString *)makeTextFrame:(NSArray *)arrayOfWords;

-(NSString *)englishToPigLatin:(NSString *)englishText;

-(NSString *)pigLatinToEnglish:(NSString *)pigLatinText;

-(NSArray *)combineAndAlternateWithArray:(NSArray *)array1 andArray:(NSArray *)array2;

-(NSArray *)digitsOfNumber:(NSInteger)inputNumber;

-(NSArray *)reverseArray:(NSArray *)inputArray;

@end
