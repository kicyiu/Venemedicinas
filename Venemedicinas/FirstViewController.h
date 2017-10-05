//
//  FirstViewController.h
//  Venemedicinas
//
//  Created by Alberto Tsang on 9/27/17.
//  Copyright © 2017 Alberto Tsang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *mediText;

- (IBAction)buscarPressed:(UIButton *)sender;

- (IBAction)mediTextEnter:(UITextField *)sender;

@end
