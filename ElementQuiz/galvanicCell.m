

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
@property(strong, nonatomic) NSString* calcium;
@end

@implementation galvanicCell



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.elements = @[@"potassium", @"barium", @"calcium", @"sodium", @"magnesium", @"aluminium", @"manganese", @"zinc", @"iron II", @"nickel", @"tin", @"lead", @"hydrogen", @"copper II", @"copper I", @"iodine", @"iron III", @"silver", @"bromine", @"chlorine", @"fluorine"]; // Creates the array of elements used to determine cathode/anode
}

- (IBAction)calculatePress:(id)sender {
    
    
    NSString *metal1 = self.metal1Text.text;
    NSString *metal2 = self.metal2Text.text;
    self.calcium = @"calcium";
    int location1 = 0;
    int location2 = 0;
    
    
    
    for (int x = 0; x < (sizeof(self.elements)); x++)// Generates a random array of symbols
    {
        if([metal1 isEqualToString:[self.elements objectAtIndex:x]]){
            location1 = x;
            
        }
        
        else if([metal2 isEqualToString:[self.elements objectAtIndex:x]]){
            location2 = x;
        }
        
        
        
        
        
    }
    
    if (location1 > location2){
        self.informationText.text = @"lol metal 1 is anode";
    }
    
    else if (location1 < location2){
        self.informationText.text = @"lol metal 2 is anode";
    }
    
    else {
        self.informationText.text = @"The values are equal -_-";
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
