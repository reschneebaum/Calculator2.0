//
//  NumberLabel.m
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "NumberLabel.h"

@implementation NumberLabel

-(void)customizeLabel:(NumberLabel *)label withTitle:(NSString *)title {
    label.layer.cornerRadius = label.bounds.size.width / 1.75;
    label.layer.borderWidth = 1.0;
    [label setTextColor:[UIColor blackColor]];
    label.layer.borderColor = label.textColor.CGColor;
    label.text = title;
    [self prepareForTapRecognition:self];
}

-(void)prepareForTapRecognition:(NumberLabel *)label {
    label.userInteractionEnabled = true;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onNumberLabelTapped:)];
    [label addGestureRecognizer:tap];
}

-(IBAction)onNumberLabelTapped:(UITapGestureRecognizer *)sender {
    [self.delegate numberLabel:self didSelectWithTap:sender];
}


@end
