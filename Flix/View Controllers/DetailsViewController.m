//
//  DetailsViewController.m
//  Flix
//
//  Created by David Lara on 6/26/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//    NSString *posterURLString = self.movie[@"poster_path"];
//    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
//    
//    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
//    [self.posterView setImageWithURL:posterURL];
//    
//    
//    NSString *backdropURLString = self.movie[@"backdrop_path"];
//    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
//    
//    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
//    [self.backdropView setImageWithURL:backdropURL];
//    
//    self.titleLabel.text = self.movie[@"title"];
//    self.overviewLabel.text = self.movie[@"overview"];
//    self.releaseDateLabel.text = self.movie[@"release_date"];
//    
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
