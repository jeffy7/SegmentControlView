//
//  ViewController.m
//  SegmentControlView
//
//  Created by je_ffy on 14-9-23.
//  Copyright (c) 2014年 je_ffy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray arrayWithObjects:@"新品",@"专题",@"热卖",nil];
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50) titleArray:array];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];

}


- (void)tapIntoIndex:(NSInteger)index {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
