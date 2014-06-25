//
//  ViewController.m
//  WebView
//
//  Created by Parallelogramist on 6/20/14.
//  Copyright (c) 2014 Oscicoil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}
//restore saved data on app load
-(void) viewWillAppear:(BOOL)animated{
    searchField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"url"];
}
//save data on app close
-(void)viewWillDisappear:(BOOL)animated{
    [[NSUserDefaults standardUserDefaults] setObject:searchField.text forKey:@"url"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    if([webView canGoBack] == YES) {
        [webView goBack];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Cannot go forward." delegate: nil cancelButtonTitle: @"Okay" otherButtonTitles:nil,nil] show];
    }
}

- (IBAction)forward:(id)sender {
    if([webView canGoForward] == YES) {
        [webView goForward];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Cannot go back." delegate: nil cancelButtonTitle: @"Okay" otherButtonTitles:nil,nil] show];
    }
}

- (IBAction)go:(id)sender {
    
    [webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://www.%@", searchField.text]]]];
    [searchField resignFirstResponder];
}
//share butotn method to share current page url
- (IBAction)share:(id)sender {
    
    [self presentViewController:
     [[UIActivityViewController alloc] initWithActivityItems:
      @[[NSString stringWithFormat:@"Check out this link!\n%@", webView.request.mainDocumentURL]] applicationActivities:nil] animated:YES completion:nil];
}

- (IBAction)keyboardDismiss:(id)sender {
    [ self go:nil ];
    [ searchField resignFirstResponder ];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self resignFirstResponder ];
}
@end
