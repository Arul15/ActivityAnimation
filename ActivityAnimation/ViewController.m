//
//  ViewController.m
//  ActivityAnimation
//
//  Created by tcs on 13/02/14.
//  Copyright (c) 2014 iPhone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CustomAnimationView *customObject = [[CustomAnimationView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    [customObject startAnimating];
    
    [self.view addSubview: customObject];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
