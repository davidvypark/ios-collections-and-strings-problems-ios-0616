//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

/**
 
 * Write your method implementations here!
 
 */

-(NSString *)makeTextFrame:(NSArray *)arrayOfWords{
    
    NSMutableArray *framedWords = [[NSMutableArray alloc] init];
    NSMutableString *longestWord = [NSMutableString stringWithString:@""];
    NSMutableString *firstAndLastRow = [NSMutableString stringWithFormat:@""];
    NSMutableString *finalResult = [NSMutableString stringWithFormat:@""];
    
    //Find the longest word in the array
    
    for(NSString *word in arrayOfWords) {
        if (word.length > longestWord.length) {
            //can I do this?? *******
            longestWord = [word mutableCopy];
        }
    }
    
    for(NSUInteger i = 0; i <longestWord.length + 4; i++) {
        [firstAndLastRow appendString:@"*"];
    }

    for(NSString *word in arrayOfWords) {
        
        NSMutableString *rowWithFramedWord = [NSMutableString stringWithString:@""];
        NSMutableString *numberOfSpaces = [NSMutableString stringWithString:@""];
        
        for (NSUInteger i = 0; i < longestWord.length - word.length; i++){
            [numberOfSpaces appendString:@" "];
        }
        
        [rowWithFramedWord stringByAppendingFormat:@"* %@%@ *",word, numberOfSpaces];
    }
    
    [finalResult appendString:firstAndLastRow];
    for(NSString *row in framedWords) {
        [finalResult stringByAppendingFormat:@"\n%@",row];
    }
    [finalResult stringByAppendingFormat:@"\n%@", firstAndLastRow];

    NSLog(@"%@", finalResult);
    return finalResult;
}

-(NSString *)englishToPigLatin:(NSString *)englishText {
    
    NSMutableArray *pigLatinwWordsArray = [[NSMutableArray alloc] init];
    NSMutableString *finalPigLatinString = [NSMutableString stringWithString:@""];
    
    NSArray *englishWordsArray = [[englishText lowercaseString] componentsSeparatedByString:@" "];
    
    for(NSUInteger i = 0; i < [englishWordsArray count]; i++) {
        NSMutableString *pigLatinString = [NSMutableString stringWithString:@""];
        NSString *currentWord = englishWordsArray[i];
        
        
        //append everything but the first letter ***DONT HAVE TO USE A LOOP HERE JUST MAKE SUBSTRING
        
        for(NSUInteger j = 1; j < currentWord.length; i++) {
            NSString *letterToAppend = [currentWord substringWithRange:NSMakeRange(j,1)];
            
            [pigLatinString appendString:letterToAppend];
        }
        
        //append the first letter to the end
        NSString *letterToAppend = [currentWord substringWithRange:NSMakeRange(0,1)];
        [pigLatinString appendString:letterToAppend];
        
        //append "ay"
        [pigLatinString appendString:@"ay"];
        
        //store that converted word into the pigLatinWordsArray
        
        [pigLatinwWordsArray addObject:pigLatinString];
        
    }
    
    //convert the piglatin array into an finalpiglatinstring and capitalize the first word
    
    for(NSUInteger i = 0; i < [pigLatinwWordsArray count]; i++) {
        NSMutableString *wordToAppend = [NSMutableString stringWithString: @""];
        
        if (i==0) {
            [wordToAppend stringByAppendingString: [[pigLatinwWordsArray[0] capitalizedString] mutableCopy]];
            [finalPigLatinString stringByAppendingString:wordToAppend];
        } else {
            [wordToAppend stringByAppendingString: pigLatinwWordsArray[i]];
            [finalPigLatinString stringByAppendingFormat:@" %@",wordToAppend];
        }
    }
    
    return finalPigLatinString;
}

-(NSString *)pigLatinToEnglish:(NSString *)pigLatinText {
    
    NSMutableArray *englishWordsArray = [[NSMutableArray alloc] init];
    NSMutableString *finalEnglishString = [NSMutableString stringWithString:@""];
    
    NSArray *pigLatinWordsArray = [[pigLatinText lowercaseString] componentsSeparatedByString:@" "];
    
    for(NSUInteger i = 0; i < [pigLatinWordsArray count]; i++) {
        NSMutableString *englishString = [NSMutableString stringWithString:@""];
        NSString *currentWord = pigLatinWordsArray[i];
        
        //append the 3rd to last letter **CHECK the -3***
        NSString *letterToAppend = [currentWord substringWithRange:NSMakeRange(currentWord.length - 3, 1)];
        [englishString appendString:letterToAppend];
        
        //append first letter to the 4th to last letter
        letterToAppend = [currentWord substringWithRange:NSMakeRange(0,currentWord.length - 4)];
        [englishString appendString:letterToAppend];
        
        //store that word into englishwordsarray
        [englishWordsArray addObject:englishString];
    }
    
    //convert the english words array into finalEnglishString
    
    for(NSUInteger i = 0; i < [englishWordsArray count]; i++) {
        NSMutableString *wordToAppend = [NSMutableString stringWithString:@""];
        
        if (i==0) {
            [wordToAppend appendString: [[englishWordsArray[0] capitalizedString] mutableCopy]];
            [finalEnglishString appendString:wordToAppend];
        } else {
            [wordToAppend appendString: englishWordsArray[i]];
            [finalEnglishString stringByAppendingFormat:@" %@", wordToAppend];
        }
    }
    
    return @"";
}

-(NSArray *)combineAndAlternateWithArray:(NSArray *)array1 andArray:(NSArray *)array2 {
    
    NSMutableArray *combinedArray = [[NSMutableArray alloc] init];
    
    // Since the arrays are supposed to alternate, Im assuming that the arrays are of the same length
    
    for(NSUInteger i = 0; i < [array1 count]; i++) {
        
        [combinedArray addObject:array1[i]];
        [combinedArray addObject:array2[i]];
        
    }
    
    return combinedArray;
}

-(NSArray *)digitsOfNumber:(NSInteger)inputNumber {
    
    NSString *numberString = [NSString stringWithFormat: @"%li", inputNumber];
    NSMutableArray *digitArray = [[NSMutableArray alloc] init];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    for(NSUInteger i = 0; i < numberString.length; i++) {
        
        NSString *currentDigitString = [numberString substringWithRange:NSMakeRange(i,1)];
        NSNumber *currentDigit = [formatter numberFromString:currentDigitString];
        
        [digitArray addObject:currentDigit];
    }
    
    
    return digitArray;
}

-(NSArray *)reverseArray:(NSArray *)inputArray {
    
    NSMutableArray *mutArray = [inputArray mutableCopy];
    
    for(NSUInteger i = 0; i < [mutArray count] /2; i++){
        
        [mutArray exchangeObjectAtIndex:i withObjectAtIndex:[mutArray count] -1];
    }
    
    return mutArray;
}

@end
