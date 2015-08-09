//
//  ViewController.m
//  Calculator
//
//  Created by Rachel Schneebaum on 8/8/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import "ViewController.h"
#import "MathManager.h"
#import "NumberLabel.h"
#import "MathLabel.h"
#import "ClearLabel.h"

@interface ViewController () <NumberLabelDelegate, MathLabelDelegate, ClearLabelDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet NumberLabel *labelOne;
@property (weak, nonatomic) IBOutlet NumberLabel *labelTwo;
@property (weak, nonatomic) IBOutlet NumberLabel *labelThree;
@property (weak, nonatomic) IBOutlet NumberLabel *labelFour;
@property (weak, nonatomic) IBOutlet NumberLabel *labelFive;
@property (weak, nonatomic) IBOutlet NumberLabel *labelSix;
@property (weak, nonatomic) IBOutlet NumberLabel *labelSeven;
@property (weak, nonatomic) IBOutlet NumberLabel *labelEight;
@property (weak, nonatomic) IBOutlet NumberLabel *labelNine;
@property (weak, nonatomic) IBOutlet NumberLabel *labelZero;
@property (weak, nonatomic) IBOutlet MathLabel *labelAdd;
@property (weak, nonatomic) IBOutlet MathLabel *labelSubtract;
@property (weak, nonatomic) IBOutlet MathLabel *labelMultiply;
@property (weak, nonatomic) IBOutlet MathLabel *labelDivide;
@property (weak, nonatomic) IBOutlet ClearLabel *labelEquals;
@property (weak, nonatomic) IBOutlet ClearLabel *labelClear;
@property (weak, nonatomic) IBOutlet UITextField *resultTextField;
@property MathManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLabels];
    self.manager = [MathManager new];
}

-(void)loadLabels {
    [self.labelOne customizeLabel:self.labelOne withTitle:@"1"];
    self.labelOne.delegate = self;
    [self.labelTwo customizeLabel:self.labelTwo withTitle:@"2"];
    self.labelTwo.delegate = self;
    [self.labelThree customizeLabel:self.labelThree withTitle:@"3"];
    self.labelThree.delegate = self;
    [self.labelFour customizeLabel:self.labelFour withTitle:@"4"];
    self.labelFour.delegate = self;
    [self.labelFive customizeLabel:self.labelFive withTitle:@"5"];
    self.labelFive.delegate = self;
    [self.labelSix customizeLabel:self.labelSix withTitle:@"6"];
    self.labelSix.delegate = self;
    [self.labelSeven customizeLabel:self.labelSeven withTitle:@"7"];
    self.labelSeven.delegate = self;
    [self.labelEight customizeLabel:self.labelEight withTitle:@"8"];
    self.labelEight.delegate = self;
    [self.labelNine customizeLabel:self.labelNine withTitle:@"9"];
    self.labelNine.delegate = self;
    [self.labelZero customizeLabel:self.labelZero withTitle:@"0"];
    self.labelZero.delegate = self;
    [self.labelAdd customizeLabel:self.labelAdd withTitle:@"+"];
    self.labelAdd.delegate = self;
    self.labelAdd.isTapped = false;
    [self.labelSubtract customizeLabel:self.labelSubtract withTitle:@"-"];
    self.labelSubtract.delegate = self;
    self.labelSubtract.isTapped = false;
    [self.labelMultiply customizeLabel:self.labelMultiply withTitle:@"x"];
    self.labelMultiply.delegate = self;
    self.labelMultiply.isTapped = false;
    [self.labelDivide customizeLabel:self.labelDivide withTitle:@"/"];
    self.labelDivide.delegate = self;
    self.labelDivide.isTapped = false;
    [self.labelEquals customizeLabel:self.labelEquals withTitle:@"="];
    self.labelEquals.delegate = self;
    self.labelEquals.isTapped = false;
    [self.labelClear customizeLabel:self.labelClear withTitle:@"AC"];
    self.labelClear.delegate = self;
}

-(void)numberLabel:(NumberLabel *)label didSelectWithTap:(UITapGestureRecognizer *)sender {
    if ([self.resultTextField.text isEqualToString:self.manager.resultString]) {
        self.resultTextField.text = label.text;
    } else {
        [self updateResultTextField:label.text];
    }
}

-(void)mathLabel:(MathLabel *)label didSelectWithTap:(UITapGestureRecognizer *)sender {
    if (self.resultTextField.text.length > 0) {
        if (self.labelAdd.isTapped == false && self.labelSubtract.isTapped == false && self.labelMultiply.isTapped == false && self.labelDivide.isTapped == false) {
            [self.manager getFirstNumberFromString:self.resultTextField.text];
            [self.manager storeOperatorAsStringFromString:label.text];
            self.resultTextField.text = @"";
            self.resultTextField.placeholder = @"";
        } else {
            [self.manager getSecondNumberFromString:self.resultTextField.text];
            [self.manager performOperation];
            [self.manager storeOperatorAsStringFromString:label.text];
            self.resultTextField.text = self.manager.resultString;
            self.manager.i1 = self.manager.result;
            self.manager.i2 = 0;
        }
        label.isTapped = true;
    } else {
        NSLog(@"you need a number first, dummy!");
    }
}

-(void)clearLabel:(ClearLabel *)label didSelectWithTap:(UITapGestureRecognizer *)sender {
    if (label == self.labelEquals) {
        [self.manager getSecondNumberFromString:self.resultTextField.text];
        [self.manager performOperation];
        self.resultTextField.text = self.manager.resultString;
    } else if (label == self.labelClear) {
        self.resultTextField.text = @"";
        self.resultTextField.placeholder = @"display result";
        self.manager.i1 = 0;
        self.manager.i2 = 0;
    }
    [self resetLabelStatus];
}

-(void)updateResultTextField:(NSString *)string {
    self.resultTextField.text = [NSString stringWithFormat:@"%@%@", self.resultTextField.text, string];
}

-(void)resetLabelStatus {
    self.labelAdd.isTapped = false;
    self.labelSubtract.isTapped = false;
    self.labelMultiply.isTapped = false;
    self.labelDivide.isTapped = false;
}

@end
