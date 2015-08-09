//
//  ClearLabel.h
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClearLabelDelegate <NSObject>

-(void)clearLabel:(id)label didSelectWithTap:(UITapGestureRecognizer *)sender;

@end

@interface ClearLabel : UILabel

@property (nonatomic, assign) id <ClearLabelDelegate> delegate;
@property BOOL isTapped;

-(void)customizeLabel:(ClearLabel *)label withTitle:(NSString *)title;
-(void)onClearLabelTapped:(UITapGestureRecognizer *)sender;

@end
