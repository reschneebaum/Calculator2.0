//
//  MathManager.m
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "MathManager.h"

@implementation MathManager

-(void)getFirstNumberFromString:(NSString *)string {
    self.i1 = [string intValue];
    self.numberStringOne = [NSString stringWithFormat:@"%i", self.i1];
}

-(void)storeOperatorAsStringFromString:(NSString *)string {
    self.operatorString = [NSString stringWithFormat:@"%@", string];
}

-(void)getSecondNumberFromString:(NSString *)string {
    self.i2 = [string intValue];
    self.numberStringTwo = [NSString stringWithFormat:@"%i", self.i2];
}

-(void)performOperation {
    if ([self.operatorString isEqualToString:@"+"]) {
        self.result = self.i1 + self.i2;
        self.resultString = [NSString stringWithFormat:@"%i", self.result];
    } else if ([self.operatorString isEqualToString:@"-"]) {
        self.result = self.i1 - self.i2;
        self.resultString = [NSString stringWithFormat:@"%i", self.result];
    } else if ([self.operatorString isEqualToString:@"x"]) {
        self.result = self.i1 * self.i2;
        self.resultString = [NSString stringWithFormat:@"%i", self.result];
    } else if ([self.operatorString isEqualToString:@"/"]) {
        if (self.i2 == 0) {
            self.resultString = @"denied!";
        } else {
            self.result = self.i1 / self.i2;
            self.resultString = [NSString stringWithFormat:@"%i", self.result];
        }
    }
//    if (self.result % 1 == 0) {
//        self.resultString = [NSString stringWithFormat:@"%i", self.result];
//    } else {
//        self.resultString = [NSString stringWithFormat:@"%.2f", (float)self.result];
//    }
}


@end
