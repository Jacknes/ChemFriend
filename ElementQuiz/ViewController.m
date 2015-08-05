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


@property (weak, nonatomic) IBOutlet UIButton *option1;
@property (weak, nonatomic) IBOutlet UIButton *option2;
@property (weak, nonatomic) IBOutlet UIButton *option3;
@property (weak, nonatomic) IBOutlet UIButton *option4;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *elementMain;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UIView *quizView;

@end

@implementation ViewController
int score = 0;
int attempts = 0;
float progress = 0.0;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.restartButton.hidden = YES; // Sets the restartButton to invisible when the view is loaded
    

    // Gathers the file path for the plist and generates a dictionary
    NSString * path = [[NSBundle mainBundle] pathForResource:@"elements" ofType:@"plist" inDirectory:nil];
    self.combos = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
   
    self.symbols = @[@"H", @"He", @"Li", @"Be", @"B", @"C", @"N", @"O", @"F", @"Ne", @"Na", @"Mg", @"Al", @"Si", @"P", @"S", @"Cl", @"Ar", @"K", @"Ca"]; // Sets the basic symbols to be used
    
    [self generateQuestions:(nil)]; // Calls the first generateQuestions to occur
}


- (IBAction)buttonPress:(id)sender
{
    NSString *selection = [(UIButton *)sender currentTitle]; // Collects the Element that has been clicked as this function handles all answer button taps
    UIButton *button = (UIButton *)sender;
    
    
    if ([selection isEqualToString:self.answer]) // Compares the selection to the answer
    {
        score++; // Iterates the score and total number of rounds
        attempts++;
        button.backgroundColor = [UIColor greenColor];
    }
    
  
    else if(![selection isEqualToString:self.answer]) // Else statement detecting if the strings are not equal
    {
        
        
        button.backgroundColor = [UIColor redColor];
        
        
        if (self.answer == self.option1.titleLabel.text)
           self.option1.backgroundColor = [UIColor greenColor];
        else if (self.answer == self.option2.titleLabel.text)
            self.option2.backgroundColor = [UIColor greenColor];
        else if (self.answer == self.option3.titleLabel.text)
            self.option3.backgroundColor = [UIColor greenColor];
        else if (self.answer == self.option4.titleLabel.text)
            self.option4.backgroundColor = [UIColor greenColor];
        
      

        
        attempts++; // Iterates the attempts
       
    }
    
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self resetButtonStates:(nil)];
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %i/%i",score, attempts]]; // Updates the score label accordingly
        [self increaseProgressValue:(nil)]; // Updates the progress bar accordingly
        [self checkGameStatus:(nil)]; // Checks the status of the game
    });
  
    
 

    
    
}


- (void)resetButtonStates:(id)sender { // Method that resets the values of the buttons after colour change
    self.option1.backgroundColor = [UIColor colorWithRed:124.0f/255.0f green:186.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    self.option2.backgroundColor = [UIColor colorWithRed:124.0f/255.0f green:186.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    self.option3.backgroundColor = [UIColor colorWithRed:124.0f/255.0f green:186.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    self.option4.backgroundColor = [UIColor colorWithRed:124.0f/255.0f green:186.0f/255.0f blue:255.0f/255.0f alpha:1.0];
}

- (void)increaseProgressValue:(id)sender {

        progress = progress+0.05; // Sets the value for the progress bar
        self.progressBar.progress = (float) progress; // Updates the value of the progressbar
}


- (void)checkGameStatus:(id)sender {
    
    if (attempts < 20){
        [self generateQuestions:(nil)];  // Generates new questions
        
    }
    
    else if (attempts >= 20){ // Ends the game
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quiz Complete"
                                                        message:@"Congratulations"
                                                       delegate:self
                                              cancelButtonTitle:@"Thanks" // Alert at the end of the game
                                              otherButtonTitles:nil];
        [alert show];
        self.option1.hidden = YES; // Hides the answer buttons
        self.option2.hidden = YES;
        self.option3.hidden = YES;
        self.option4.hidden = YES;
        self.restartButton.hidden = NO; // Hides all game buttons allowing for a restart
        
        
    }
    
}



- (void)generateQuestions:(id)sender
{
    NSMutableArray *answersArr = [[NSMutableArray alloc] init]; // Creates and Array that will hold the answers
    
    int randomQuestion = arc4random_uniform(19); // Selects a random element
    
    self.answer = self.symbols[randomQuestion]; //Sets the correct answer
    
    [self.elementMain setText:[NSString stringWithFormat:@"What is the Symbol for %@?",self.combos[self.answer]]];     // Set the question label here.
    
    answersArr[0] = self.answer; // Sets the first element of the array as the right answer
    
    
    for (int x = 1; x < 4; x++)// Generates a random array of symbols
    {
        
        BOOL isTheObjectThere = true; // Works similiar to a bubble sort
        
        while (isTheObjectThere){ // Until the random object is not in the array already this will loop
            int rand = arc4random_uniform(19); // Generates a random number between 0-19
            isTheObjectThere = [answersArr containsObject: self.symbols[rand]]; // Checks if 
            if (!isTheObjectThere){
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



- (IBAction)restartGame:(id)sender {
    
    score = 0;
    attempts = 0;
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %i/%i",score, attempts]];
    self.option1.hidden = NO;
    self.option2.hidden = NO;
    self.option3.hidden = NO;
    self.option4.hidden = NO;
    self.restartButton.hidden = YES;
    [self generateQuestions:(nil)];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
