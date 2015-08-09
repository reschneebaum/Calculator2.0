//
//  NumberLabel.h
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberLabelDelegate <NSObject>

-(void)numberLabel:(id)label didSelectWithTap:(UITapGestureRecognizer *)sender;

@end

@interface NumberLabel : UILabel

@property (nonatomic, assign) id <NumberLabelDelegate> delegate;
@property BOOL isTapped;

-(void)customizeLabel:(NumberLabel *)label withTitle:(NSString *)title;
-(void)onNumberLabelTapped:(UITapGestureRecognizer *)sender;

@end
