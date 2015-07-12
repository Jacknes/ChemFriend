//
//  ViewController.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 30/06/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(strong, nonatomic) NSArray* symbols;
@property(strong, nonatomic) NSMutableArray * elements;
@property(strong, nonatomic) NSMutableArray * questions;
@property(strong, nonatomic) NSString * answer;
@property(strong, nonatomic) NSDictionary * combos;


//@property(strong, nonatomic) NSNumber * rand;
@property (weak, nonatomic) IBOutlet UIButton *option1;
@property (weak, nonatomic) IBOutlet UIButton *option2;
@property (weak, nonatomic) IBOutlet UIButton *option3;
@property (weak, nonatomic) IBOutlet UIButton *option4;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *elementMain;
@end

@implementation ViewController
int score = 0;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Gathers the file path for the plist and generates a dictionary
    NSString * path = [[NSBundle mainBundle] pathForResource:@"elements" ofType:@"plist" inDirectory:nil];
    self.combos = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
   
    self.symbols = @[@"H", @"He", @"Li", @"Be", @"B", @"C", @"N", @"O", @"F", @"Ne", @"Na", @"Mg", @"Al", @"Si", @"P", @"S", @"Cl", @"Ar", @"K", @"Ca"];
    
    [self generateQuestions:(nil)];
    
    
    
  /*  //self.option1.titleLabel.text = self.symbols[0];
    [self.option1 setTitle:self.symbols[0] forState:UIControlStateNormal];
    [self.option2 setTitle:self.symbols[1] forState:UIControlStateNormal];
    [self.option3 setTitle:self.symbols[2] forState:UIControlStateNormal];
   */
    
    
    
    
}
- (IBAction)buttonPress:(id)sender
{
    NSString *selection = [(UIButton *)sender currentTitle];
    
    
    if ([selection isEqualToString:self.answer])
    {
        score++;
       // NSString *strFromInt = [NSString stringWithFormat:@"%d",score];
       // self.scoreLabel.text = (@"Score: %@", strFromInt);
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %i",score]];
    
        
    // Make it pop up message here.
    /*  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct!" message:@"You answered correctly and gained + 1 score!" delegate:self cancelButtonTitle:@"Okay"];
        [alert show];
       */
        
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct!"
    message:@"You answered correctly"
    delegate:self
    cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    
    [alert show];
    }
    
    // Else statement detecting if the strings are not equal
    else if(![selection isEqualToString:self.answer])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong!"
                                                        message:@"You answered incorrectly :c"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    // Generates new questions
    [self generateQuestions:(nil)];
    
    
}




- (void)generateQuestions:(id)sender
{
    NSMutableArray *answersArr = [[NSMutableArray alloc] init];
    // Selects a random element
    int randomQuestion = arc4random_uniform(19);
    // Selects a random button
    //int randomButton = arc4random_uniform(3);
    //Sets the correct answer
    self.answer = self.symbols[randomQuestion];
    //[self.buttons(randomButton) setTitle:self.symbols[randomQuestion] forState:UIControlStateNormal];

    
    // Set the question label here.
    
    [self.elementMain setText:[NSString stringWithFormat:@"%@",self.combos[self.answer]]];
    
    answersArr[0] = self.answer;
    
    
    for (int x = 1; x < 4; x++)// Generates a random array of symbols
    {
        
        BOOL isTheObjectThere = true;
        
        while (isTheObjectThere == true){
            int rand = arc4random_uniform(19);
            isTheObjectThere = [answersArr containsObject: self.symbols[rand]];
            if (isTheObjectThere == false){
                answersArr[x] = self.symbols[rand];
            }
        }
       
       
        
    }
    
    
    
    for (int x= 0; x < 4; x++)
    {
        NSString * temp = answersArr[x];
        int rand = arc4random_uniform(3);
        
        [answersArr replaceObjectAtIndex:x withObject:answersArr[rand]];
      
        [answersArr replaceObjectAtIndex:rand withObject:temp];
        
        
        
    }
    
    
    
    for (int i = 0; i < 3; i++)
    {
        
        [self.option1 setTitle:answersArr[0] forState:UIControlStateNormal];
        [self.option2 setTitle:answersArr[1] forState:UIControlStateNormal];
        [self.option3 setTitle:answersArr[2] forState:UIControlStateNormal];
        [self.option4 setTitle:answersArr[3] forState:UIControlStateNormal];
        
       
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
