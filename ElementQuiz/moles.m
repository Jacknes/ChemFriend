

//
//  ViewController.m
//  MoleCalc
//
//  Created by Jack Pascoe on 1/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "moles.h"

@interface moles ()
@property (weak, nonatomic) IBOutlet UITextField *massText;
@property (weak, nonatomic) IBOutlet UITextField *molarText;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (strong, nonatomic) IBOutlet UIView *unitSelector;
@end

@implementation moles

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)calcPressed:(id)sender
{
    float mass = [self.massText.text floatValue];
    float molar = [self.molarText.text floatValue];
    float result = (mass/molar);
    
    self.resultText.text = [NSString stringWithFormat:@"%f", result];
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
