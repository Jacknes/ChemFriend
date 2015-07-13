//
//  molarHeat.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 12/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "molarHeat.h"

@interface molarHeat ()
@property (weak, nonatomic) IBOutlet UITextField *massText;
@property (weak, nonatomic) IBOutlet UITextField *specificText;
@property (weak, nonatomic) IBOutlet UITextField *tempChangeText;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UITextField *deltaHText;

@end



@implementation molarHeat

- (IBAction)calcPressed:(id)sender
{
    float mass = [self.massText.text floatValue];
    float specific = [self.specificText.text floatValue];
    float temp = [self.tempChangeText.text floatValue];
    float result = -(mass * specific * temp);
    
    self.deltaHText.text = [NSString stringWithFormat:@"%f", result];
    
    
    
    
    
    
    
    
    
}




@end