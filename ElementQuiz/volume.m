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

int condition = 0;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)calcPressed:(id)sender
{
    
    // STP - 22.71L/mol
    
    // RTP - 24.79L/mol
    
    
    
    
   /* float mass = [self.massText.text floatValue];
    float molar = [self.molarText.text floatValue];
    float result = (mass/molar);
    
    self.resultText.text = [NSString stringWithFormat:@"%f", result];*/
    
    
    
    
    

    
}


- (IBAction)conditionChanged:(id)sender
{
    [self.conditionSelect addTarget:self
                         action:@selector(action:)
               forControlEvents:UIControlEventValueChanged];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end