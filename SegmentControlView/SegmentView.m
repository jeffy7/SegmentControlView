//
//  SegmentView.m
//  SegmentControlView
//
//  Created by je_ffy on 14-9-23.
//  Copyright (c) 2014年 je_ffy. All rights reserved.
//

#import "SegmentView.h"

static int currentNumber = 0;
@implementation SegmentView

-(void)dealloc {
    
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray {
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleArray = [[NSMutableArray alloc] init];
        float width = frame.size.width/[titleArray count];
        _backView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, width - 10, frame.size.height - 10)];
        _backView.layer.masksToBounds = 10;
        _backView.layer.cornerRadius = 5;
        _backView.backgroundColor =[UIColor purpleColor];
        [self addSubview:_backView];
        
        
        for (int i = 0; i < [titleArray count]; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*width, 0, width, frame.size.height)];
            label.tag = 100+i;
            label.textColor = [UIColor cyanColor];

            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            label.text = titleArray[i];
            [_titleArray addObject:label];
            
        }
        
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    for (int i = 0; i< [_titleArray count]; i++) {
        UILabel *label = _titleArray[i];
        label.textColor = [UIColor cyanColor];

        if (currentNumber != i) {
            if ([SegmentView isrect:[_titleArray[i] frame] contantPoint:point]) {
                if ([_delegate respondsToSelector:@selector(tapIntoIndex:)]) {
                    [_delegate tapIntoIndex:i];
                    [UIView animateWithDuration:0.3f animations:^{
                        _backView.frame = CGRectMake(label.frame.origin.x +5, label.frame.origin.y +5, label.bounds.size.width - 10, label.frame.size.height - 10);;
                    }];
                    
                }
            }
        }
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    for (int i = 0; i < [_titleArray count]; i++) {
        UILabel *label = _titleArray[i];
        if ([SegmentView isrect:[label frame] contantPoint:point]) {
            label.textColor = [UIColor redColor];
            currentNumber = i;
    
        }
    }
}

+ (BOOL)isrect:(CGRect)rect contantPoint:(CGPoint)point {
    if (point.x >= rect.origin.x && point.x <= rect.origin.x + rect.size.width && point.y >= rect.origin.y && point.y <= rect.origin.y +rect.size.height) {
        return YES;
    }
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
