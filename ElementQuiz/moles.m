

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
    [self.massText becomeFirstResponder];
}


/*- (IBAction)resignKeyboards:(id)sender {
    [self.massText resignFirstResponder];
    [self.molarText resignFirstResponder];
    [self.resultText resignFirstResponder];

    
    
}*/

- (IBAction)calcPressed:(id)sender
{
    float mass = [self.massText.text floatValue];
    float molar = [self.molarText.text floatValue];
    float result = [self.resultText.text floatValue];
    

    
    if (result == 0) {
        float result = (mass / molar);
        self.resultText.text = [NSString stringWithFormat:@"%f", result];
    }
    
    else if (mass == 0) {
        float mass = (molar * result);
        self.massText.text = [NSString stringWithFormat:@"%f", mass];
    }
    
    else if (molar == 0) {
        float molar = (mass / result);
        self.molarText.text = [NSString stringWithFormat:@"%f", molar];
        
    }
   
    


    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
