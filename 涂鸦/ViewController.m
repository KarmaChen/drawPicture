//
//  ViewController.m
//  涂鸦
//
//  Created by Karma on 16/6/6.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"
#import "HCDrawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clearAllPat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clearAllPat:(id)sender {
    HCDrawView *drawView = (HCDrawView *) self.view;
    [drawView clearAllPath];
}

@end
