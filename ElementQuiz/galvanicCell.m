

//
//  ViewController.m
//  MoleCalc
//
//  Created by Jack Pascoe on 1/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "galvanicCell.h"

@interface galvanicCell ()
@property (weak, nonatomic) IBOutlet UITextField *metal1Text;
@property (weak, nonatomic) IBOutlet UITextField *metal2Text;
@property (weak, nonatomic) IBOutlet UITextView *informationText;
@property(strong, nonatomic) NSArray* elements;
@property(strong, nonatomic) NSDictionary * voltages;
@property (weak, nonatomic) IBOutlet UITextField *cathodeText;
@property (weak, nonatomic) IBOutlet UITextField *anodeText;
@property (weak, nonatomic) IBOutlet UITextField *voltageText;



@end

@implementation galvanicCell



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.elements = @[@"potassium", @"barium", @"calcium", @"sodium", @"magnesium", @"aluminium", @"manganese", @"zinc", @"iron II", @"nickel", @"tin", @"lead", @"hydrogen", @"copper II", @"copper", @"iodine", @"iron III", @"silver", @"bromine", @"chlorine", @"fluorine"]; // Creates the array of elements used to determine cathode/anode

    NSString * path = [[NSBundle mainBundle] pathForResource:@"voltages" ofType:@"plist" inDirectory:nil];
    self.voltages = [NSDictionary dictionaryWithContentsOfFile:path];
    
}



- (IBAction)resignKeyboards:(id)sender {
    [self.metal1Text resignFirstResponder];
    [self.metal2Text resignFirstResponder];
    [self.cathodeText resignFirstResponder];
    [self.anodeText resignFirstResponder];
    [self.voltageText resignFirstResponder];
    
    
    
}




- (IBAction)calculatePress:(id)sender {
    
    
    NSString *metal1 = self.metal1Text.text;
    NSString *metal2 = self.metal2Text.text;
    NSNumber *volt1;
    NSNumber *volt2;
    NSNumber *voltage;
    
    int location1 = 0;
    int location2 = 0;
    
    
    
    for (int x = 0; x < [self.elements count]; x++)// Generates a random array of symbols
    {
        if([metal1 isEqualToString:[self.elements objectAtIndex:x]]){
            location1 = x;
            
        }
        
        else if([metal2 isEqualToString:[self.elements objectAtIndex:x]]){
            location2 = x;
        }
        
        
        
        
        
    }
    
    if (location1 > location2){
        self.cathodeText.text = metal1;
        self.anodeText.text = metal2;
        volt1 = [self.voltages objectForKey:metal1];
        
        volt2 = [self.voltages objectForKey:metal2];
        voltage = @([volt1 floatValue] - [volt2 floatValue]);
        
      
        
        self.voltageText.text = [NSString stringWithFormat:@"%@", voltage];
        // NSNumber *sum = @([first integerValue] + [second integerValue]);
        // [NSString stringWithFormat:@"%@%d%@%d", part1,num1, part2, num2];
        
        
        
    }
    
    else if (location1 < location2){
        self.cathodeText.text = metal2;
        self.anodeText.text = metal1;
        volt1 = [self.voltages objectForKey:metal1];
       // Need to make one neg
        volt2 = [self.voltages objectForKey:metal2];
        voltage = @([volt2 floatValue] - [volt1 floatValue]);
        self.voltageText.text = [NSString stringWithFormat:@"%@", voltage];
    }
    
    else {
        self.voltageText.text = @"The values are equal -_-";
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
