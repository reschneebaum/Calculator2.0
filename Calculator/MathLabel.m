//
//  MathLabel.m
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "MathLabel.h"

@implementation MathLabel

-(void)customizeLabel:(MathLabel *)label withTitle:(NSString *)title {
    label.layer.cornerRadius = label.bounds.size.width / 1.75;
    label.layer.borderWidth = 1.0;
    [label setTextColor:[UIColor whiteColor]];
    [label.layer setBackgroundColor:[UIColor grayColor].CGColor];
    label.layer.borderColor = label.backgroundColor.CGColor;
    label.text = title;
    [self prepareForTapRecognition:self];
}

-(void)prepareForTapRecognition:(MathLabel *)label {
    label.userInteractionEnabled = true;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMathLabelTapped:)];
    [label addGestureRecognizer:tap];
}

-(IBAction)onMathLabelTapped:(UITapGestureRecognizer *)sender {
    [self.delegate mathLabel:self didSelectWithTap:sender];
}

@end
