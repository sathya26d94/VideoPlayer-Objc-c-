//
//  ViewController.m
//  VideoPlayer
//
//  Created by SaTHYa on 25/04/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic) VideoViewController *videoViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _videoViewController = [[VideoViewController alloc] init];
    [self.view addSubview:_videoViewController.view];
    [self constraint];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [self constraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)constraint {
    [_videoViewController.view removeAllConstraints];
    _videoViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_videoViewController.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_videoViewController.view
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_videoViewController.view
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f
                                                                         constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_videoViewController.view
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0f
                                                                        constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_videoViewController.view
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0f
                                                                         constant:110];
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        [self.view addConstraints:@[leftConstraint, topConstraint, rightConstraint, bottomConstraint]];
    } else {
        [self.view addConstraints:@[leftConstraint, topConstraint, rightConstraint, heightConstraint]];
    }
}

@end


@implementation UIView (RemoveConstraints)

- (void)removeAllConstraints
{
    UIView *superview = self.superview;
    while (superview != nil) {
        for (NSLayoutConstraint *c in superview.constraints) {
            if (c.firstItem == self || c.secondItem == self) {
                [superview removeConstraint:c];
            }
        }
        superview = superview.superview;
    }
    
    [self removeConstraints:self.constraints];
    self.translatesAutoresizingMaskIntoConstraints = YES;
}

@end

