//
//  MovieDetailViewController.m
//  RottenTomatos
//
//  Created by Matt Ho on 1/25/15.
//  Copyright (c) 2015 Yahoo Inc. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *thumbnailUrl = [self.movie valueForKeyPath:@"posters.thumbnail"];
    NSString *originalUrl = [thumbnailUrl stringByReplacingOccurrencesOfString:@"_tmb" withString:@"_ori"];
    
    // self.titleLabel.text = self.movie[@"title"];
    // self.synopsysLabel.text = self.movie[@"synopsis"];
    [self.posterView setImageWithURL:[NSURL URLWithString:thumbnailUrl]];
    [self.posterView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:originalUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [UIView transitionWithView:self.posterView duration:2.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{ self.posterView.image = image;
        } completion:nil];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
