//
//  MathManager.h
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathManager : NSObject

@property int i1;
@property int i2;
@property int result;
@property NSString *numberStringOne;
@property NSString *numberStringTwo;
@property NSString *operatorString;
@property NSString *resultString;

-(void)getFirstNumberFromString:(NSString *)string;
-(void)storeOperatorAsStringFromString:(NSString *)string;
-(void)getSecondNumberFromString:(NSString *)string;
-(void)performOperation;

@end
