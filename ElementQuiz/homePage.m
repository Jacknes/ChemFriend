

//
//  ViewController.m
//  MoleCalc
//
//  Created by Jack Pascoe on 1/07/2015.
//  Copyright (c) 2015 Jack Pascoe. All rights reserved.
//

#import "homePage.h"

@interface homePageClass ()
@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property(strong, nonatomic) NSArray* pictures;

@end

@implementation homePageClass

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pictures = @[@"MoleCalc300", @"SpecificHeat300", @"Volume300.png", @"GalvanicCell300", @"Quiz-action300" ]; //
    [self goThroughPictures:(nil)];
    
}


- (void)goThroughPictures:(id)sender {
    
    
    
    NSArray *animationImages = [[NSArray alloc] initWithObjects:
                                [UIImage imageNamed:@"MoleCalc300"],
                                [UIImage imageNamed:@"SpecificHeat300"],
                                [UIImage imageNamed:@"Volume300"],
                                [UIImage imageNamed:@"GalvanicCell300"],
                                [UIImage imageNamed:@"Quiz-action300"],
                                nil];
        

    
    self.imagePreview.animationImages=animationImages;
    self.imagePreview.animationDuration = 15;
    [self.imagePreview startAnimating];
    
    
  

   
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
