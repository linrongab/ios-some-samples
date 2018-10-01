//
//  ViewController.m
//  scrollViewTest
//
//  Created by linrong on 2018/9/30.
//  Copyright © 2018年 linrong. All rights reserved.
//

#import "ViewController.h"

#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.frame = CGRectMake(0, 0, kWidth, kHeight);
    self.scrollView.contentSize =CGSizeMake(kWidth, kHeight*2);
    self.scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView.delegate = self;
    self.imgView.frame = CGRectMake(0, 0, kWidth, kHeight / 3);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"offset %f ",scrollView.contentOffset.y);
    NSLog(@"frame %f ",self.imgView.frame.origin.y);
    CGFloat ratio = 3 * kWidth/kHeight;
    CGFloat y_offset = - scrollView.contentOffset.y - 20;
    if(y_offset > 0){
        CGRect f= self.imgView.frame;
        f.origin.y = - y_offset;
        f.origin.x = - y_offset * ratio/2;
        f.size.width = kWidth + y_offset * ratio;
        f.size.height = kHeight / 3 + y_offset;
        self.imgView.frame = f;

        //CGFloat new_h = CGRectGetHeight(self.imgView.frame) + y_offset;
        //CGFloat new_w = CGRectGetWidth(self.imgView.frame) + ratio * y_offset;
        //CGFloat new_x = CGRectGetMinX(self.imgView.frame) - 0.5 * ratio * y_offset;
        //CGFloat new_y = CGRectGetMinY(self.imgView.frame) - y_offset;
        //self.scrollView.frame = CGRectMake(new_x, new_y, new_w, new_h);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
