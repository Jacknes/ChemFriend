//
//  volume.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 13/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//



#import "volume.h"

@interface volume ()
@property (weak, nonatomic) IBOutlet UITextField *valueText;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelect;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conditionSelect;


@end



@implementation volume

float condition = 24.79; // Because the segment display is automatically on RTP
float result = 0.0;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// STP - 22.71L/mol

// RTP - 24.79L/mol


- (IBAction)calcPressed:(id)sender
{
    float value;
    
    if ([self.unitSelect selectedSegmentIndex] == 0) {
        
        value = [self.valueText.text floatValue];
        
        result = (value/condition);
        
        self.resultText.text = [NSString stringWithFormat:@"%f", result];
        self.resultLabel.text = @"Moles";
        
        
    }
    
    else if ([self.unitSelect selectedSegmentIndex] == 1){
        
        float value;
            
            value = [self.valueText.text floatValue];
            result = (value * condition);
            
            self.resultText.text = [NSString stringWithFormat:@"%f", result];
            self.resultLabel.text = @"Volume";
        
    }
    
   
    
    

    

    
    

    
}


- (IBAction)conditionChanged:(id)sender
{
    if ([self.conditionSelect selectedSegmentIndex] == 1) {
        condition = 22.71; // Sets the condition as STP
        
    }
    
    else if ([self.conditionSelect selectedSegmentIndex] == 0) {
        condition = 24.79; // Sets the condition as RTP
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end