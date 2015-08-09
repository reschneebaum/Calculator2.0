//
//  MathLabel.h
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MathLabelDelegate <NSObject>

-(void)mathLabel:(id)label didSelectWithTap:(UITapGestureRecognizer *)sender;

@end

@interface MathLabel : UILabel

@property (nonatomic, assign) id <MathLabelDelegate> delegate;
@property BOOL isTapped;

-(void)customizeLabel:(MathLabel *)label withTitle:(NSString *)title;
-(void)onMathLabelTapped:(UITapGestureRecognizer *)sender;

@end
