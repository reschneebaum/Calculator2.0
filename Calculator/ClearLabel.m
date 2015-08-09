//
//  ClearLabel.m
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "ClearLabel.h"

@implementation ClearLabel

-(void)customizeLabel:(ClearLabel *)label withTitle:(NSString *)title {
    label.layer.cornerRadius = label.bounds.size.width / 1.75;
    label.layer.borderWidth = 1.0;
    [label setTextColor:[UIColor whiteColor]];
    [label.layer setBackgroundColor:[UIColor blackColor].CGColor];
    [label.layer setBorderColor:[UIColor grayColor].CGColor];
    label.text = title;
    [self prepareForTapRecognition:self];
}

-(void)prepareForTapRecognition:(ClearLabel *)label {
    label.userInteractionEnabled = true;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClearLabelTapped:)];
    [label addGestureRecognizer:tap];
}

-(IBAction)onClearLabelTapped:(UITapGestureRecognizer *)sender {
    [self.delegate clearLabel:self didSelectWithTap:sender];
}

@end
