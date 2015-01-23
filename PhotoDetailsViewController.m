//
//  PhotoDetailsViewController.m
//  InstagramClient
//
//  Created by Xiangnan Xu on 1/22/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "PhotoDetailsViewController.h"

@interface PhotoDetailsViewController ()

@property (weak, nonatomic)  NSDictionary *photoDict;

@end

@implementation PhotoDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
