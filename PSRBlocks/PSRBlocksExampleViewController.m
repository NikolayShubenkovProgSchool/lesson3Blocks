//
//  ViewController.m
//  PSRBlocks
//
//  Created by n.shubenkov on 29/08/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRBlocksExampleViewController.h"

#import <DLAlertView/DLAVAlertView.h>
//dlalertView

@interface PSRBlocksExampleViewController () <UIAlertViewDelegate>

@end

@implementation PSRBlocksExampleViewController
            
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self p_showSomeBlocks];
};

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

//    [self  showAlert];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        return ;
//        [self animate];
//    });
    
}


#pragma mark - Alerts
- (IBAction)howAlertWithBlock
{
    DLAVAlertView *alert = [[DLAVAlertView alloc]initWithTitle:@"titile" message:@"fasfas" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"asfa",@"sdsgdd", nil];
    
    [alert showWithCompletion:^(DLAVAlertView *alertView, NSInteger buttonIndex) {
        
        NSLog(@"clicked button: %ld",buttonIndex);
        if (buttonIndex == 0){
            DLAVAlertView *alert = [[DLAVAlertView alloc]initWithTitle:@"titile2" message:@"fasfa sasa ssa s ss" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"sdsgdd", nil];
            [alert showWithCompletion:^(DLAVAlertView *alertView, NSInteger buttonIndex) {
                NSLog(@"finished 4");
            }];
        }
        
        else {
            
            DLAVAlertView *alert = [[DLAVAlertView alloc]initWithTitle:@"titile3" message:@"хотите глянутьанимацию?" delegate:nil cancelButtonTitle:@"да" otherButtonTitles:@"нет", nil];
            [alert showWithCompletion:^(DLAVAlertView *alertView, NSInteger buttonIndex) {
                NSLog(@"finished 3");
                if (buttonIndex == 0){
                    [self animation];
                }
            }];
            
        }
    }];
}



- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"Hellow alert view"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:@"cancel", nil];
    alert.tag = 5;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIButton *button = [alertView buttonTitleAtIndex:buttonIndex];
    NSLog(@"user clicked Ok Button");
    
    if (alertView.tag == 5){
        //do something
    }
}


- (IBAction)cycleAnimation
{
    [UIView animateWithDuration:1
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect firstViewFrame = self.firstView.frame;
                         self.firstView.frame = self.secondView.frame;
                         self.secondView.frame = firstViewFrame;
                         self.secondView.backgroundColor = [UIColor orangeColor];
                         self.firstView.backgroundColor = [UIColor yellowColor];
                         
                         self.firstView.alpha = 1;
                         self.secondView.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         if (finished){
                             [self cycleAnimation];
                         }
//                         self.firstView.alpha
                     }];
                        

}
    // Do any additional setup after loading the view, typically from a nib.

- (IBAction)animation
{
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut                     animations:^{
                         
                         self.secondView.frame = self.firstView.frame
                         ;
                         self.firstView.frame = self.view.bounds;
                         
                         self.firstView.alpha = 0;
                         self.secondView.alpha = 0;
                         
                         
                     } completion:^(BOOL finished) {
                         if (finished){
                         }
                     }];

}

- (IBAction)p_showSomeBlocks
{
    return;
    NSArray *strings = @[@"asfa",@"afsfs",@"vasya",@"privet"];
    
    NSString *searchKey = @"vasya";
    
    [strings enumerateObjectsUsingBlock:^(NSString  *str, NSUInteger idx, BOOL *stop) {
        if ([str isEqualToString:searchKey]){
            NSLog(@"Vasya, you was found");
            *stop = YES;
        }
    }];
    
    __block int c = 77;
    
    int(^multiply)(int a, int b) = ^(int a, int b) {
        
        c += 60;
        int result = a * b * c;
        NSLog(@"result: %d",result);
        return result;
    };
    NSLog(@"c = %d",c);
    int var = multiply (55,33);
    
    NSLog(@"c = %d",c);
    
    NSLog(@"new muiltiply: %d",multiply(212,12));
    
}


@end
