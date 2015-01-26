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
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsysLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadPoster];
    [self setupScrollView];

    self.title = self.movie[@"title"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadPoster {
    NSString *thumbnailUrl = [self.movie valueForKeyPath:@"posters.thumbnail"];
    NSString *originalUrl = [thumbnailUrl stringByReplacingOccurrencesOfString:@"_tmb" withString:@"_ori"];

    [self.posterView setImageWithURL:[NSURL URLWithString:thumbnailUrl]];
    [self.posterView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:originalUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [UIView transitionWithView:self.posterView duration:2.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{ self.posterView.image = image;
        } completion:nil];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void) setupScrollView {
    NSString *criticsScore = [[self.movie valueForKeyPath:@"ratings.critics_score"] stringValue];
    NSString *audienceScore = [[self.movie valueForKeyPath:@"ratings.audience_score"] stringValue];
    
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.scoreLabel];
    [self.scrollView addSubview:self.synopsysLabel];
    
    self.titleLabel.text = self.movie[@"title"];
    self.scoreLabel.text = [NSString stringWithFormat:@"Critics Score:%@, Audience Score:%@\n%@", criticsScore, audienceScore, self.movie[@"mpaa_rating"]];
    self.synopsysLabel.text = self.movie[@"synopsis"];
    [self.synopsysLabel sizeToFit];

    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scrollView.subviews)
        contentRect = CGRectUnion(contentRect, view.frame);
    self.scrollView.contentSize = contentRect.size;
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
