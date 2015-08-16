//
//  SegmentView.h
//  SegmentControlView
//
//  Created by je_ffy on 14-9-23.
//  Copyright (c) 2014年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentViewDelegate <NSObject>

- (void)tapIntoIndex:(NSInteger)index;

@end

@interface SegmentView : UIView {
    UIButton *_button;
    id <SegmentViewDelegate> _delegate;
    NSMutableArray *_titleArray;
    UIView *_backView;
    
}
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, assign) id<SegmentViewDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *titleArray;
@property (nonatomic, retain) UIView *backView;

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

+ (BOOL)isrect:(CGRect)rect contantPoint:(CGPoint)point;

@end
