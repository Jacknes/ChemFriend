//
//  ViewController.m
//  ElementQuiz
//
//  Created by Jack Pascoe on 30/06/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) NSArray * symbols;
@property(strong, nonatomic) NSArray * elements;
@property(strong, nonatomic) NSString * answer;
@property(strong, nonatomic) NSNumber * score;
//@property(strong, nonatomic) NSNumber * rand;
@property (weak, nonatomic) IBOutlet UIButton *option1;
@property (weak, nonatomic) IBOutlet UIButton *option2;
@property (weak, nonatomic) IBOutlet UIButton *option3;
@property (weak, nonatomic) IBOutlet UIButton *option4;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *elementMain;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 //   NSArray * symbols = [@"H", @"He"];
    
    
    
    
    self.symbols = @[@"H", @"He", @"Li", @"Be", @"B", @"C", @"N"];
    
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
    self.scoreLabel.text = selection;
    
    if ([selection isEqualToString:self.answer])
    {
     self.scoreLabel.text = @"+1 xdd";
     //self.score = (self.score + 1)
        
    // Make it pop up message here.
        
    }
    
}




- (void)generateQuestions:(id)sender
{
    
    // Selects a random element
    int randomQuestion = arc4random_uniform(6);
    // Selects a random button
    int randomButton = arc4random_uniform(3);
    //Sets the correct answer
    self.answer = self.symbols[randomQuestion];
    //[self.buttons(randomButton) setTitle:self.symbols[randomQuestion] forState:UIControlStateNormal];

    
    for (int i = 0; i < 3; i++)
    {
        int rands = arc4random_uniform(3);
        [self.option1 setTitle:self.symbols[0] forState:UIControlStateNormal];
        [self.option2 setTitle:self.symbols[1] forState:UIControlStateNormal];
        [self.option3 setTitle:self.symbols[2] forState:UIControlStateNormal];
        [self.option4 setTitle:self.symbols[randomQuestion] forState:UIControlStateNormal];
        
       
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
