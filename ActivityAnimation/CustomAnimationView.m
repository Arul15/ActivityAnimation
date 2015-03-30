//
//  CustomAnimationView.m
//  ActivityAnimation
//
//  Created by tcs on 13/02/14.
//  Copyright (c) 2014 iPhone. All rights reserved.
//

#import "CustomAnimationView.h"

@implementation CustomAnimationView

//- (void)awakeFromNib
//{
//	[self doInit];
//}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
	{
		[self doInit];
    }
	
    return self;
}

- (void)doInit
{
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 63, 63)];
	
	[imageView setImage:[UIImage imageNamed:@"exp1.png"]];
	
	images = [[NSArray alloc] initWithObjects:
			  [UIImage imageNamed:@"exp3.png"],
			  [UIImage imageNamed:@"exp2.png"],
			  nil];
	
	[self addSubview:imageView];
	
	isAnimating = NO;
}

- (void)startAnimating
{
	if (isAnimating)
		return;
	
	isAnimating = YES;
	status = 0;
	
	[self setHidden:NO];
	[imageView setImage:[UIImage imageNamed:@"exp1.png"]];
	
	[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(updateAnimation) userInfo:nil repeats:NO];
}

- (void)updateAnimation
{
	switch (status)
	{
		case 0:
			status = 1;
			[imageView setImage:[UIImage imageNamed:@"exp2.png"]];
			[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateAnimation) userInfo:nil repeats:NO];
			break;
		case 1:
			status = 2;
			[imageView setImage:[UIImage imageNamed:@"exp3.png"]];
			[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateAnimation) userInfo:nil repeats:NO];
			break;
		case 2:
			[imageView setAnimationImages:images];
			[imageView setAnimationDuration:1];
			[imageView startAnimating];
			break;
		default:
			break;
	}
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self setHidden:YES];
	return NO;
}

- (void)stopAnimating
{
	isAnimating = NO;
	
	[imageView stopAnimating];
	[imageView setAnimationImages:nil];
}

- (BOOL)isAnimating
{
	return isAnimating;
}

@end
