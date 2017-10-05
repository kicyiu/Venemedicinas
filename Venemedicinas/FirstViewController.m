//
//  FirstViewController.m
//  Venemedicinas
//
//  Created by Alberto Tsang on 9/27/17.
//  Copyright © 2017 Alberto Tsang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buscarPressed:(UIButton *)sender {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    // insert whatever URL you would like to connect to

    NSString *strURL=[NSString stringWithFormat:@"https://silkefischer.000webhostapp.com/getMedicin.php?name=%@", self.mediText.text];
    NSLog( @"%@", strURL );
    
    [request setURL:[NSURL URLWithString:strURL]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^( NSData *data, NSURLResponse *response, NSError *error )
    {
        dispatch_async( dispatch_get_main_queue(),
         ^{
             // parse returned JSON array
             NSError *jsonError;
             NSArray *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
             
           
             NSLog( @"%@", parsedJSONArray );
             
             
             for (NSDictionary *item in parsedJSONArray) {
                 NSLog(@"Descripcion => %@", item[@"Description"]);
                 //NSLog(@"-%@", item[@"variant"]);
                 for (NSDictionary *variant in item[@"variant"]) {
                     NSLog(@"-%@/%@", variant[@"City"], variant[@"Name"]);
                 }
   
         
          
             }
             
         } );
    }];
    
    [task resume];
    
}

- (IBAction)mediTextEnter:(UITextField *)sender {
}

- ( NSURLSession * )getURLSession
{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken,
                  ^{
                      NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
                      session = [NSURLSession sessionWithConfiguration:configuration];
                  } );
    
    return session;
}
@end
