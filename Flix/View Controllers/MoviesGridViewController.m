//
//  MoviesGridViewController.m
//  Flix
//
//  Created by David Lara on 6/26/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import "MoviesGridViewController.h"
#import "MovieCollectionCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface MoviesGridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) NSArray *filteredMovies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) UIAlertController *fetchAlert;
@property (weak, nonatomic) IBOutlet UICollectionView *moviesCollectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MoviesGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.moviesCollectionView.dataSource = self;
    self.moviesCollectionView.delegate = self;
    self.searchBar.delegate = self;
    
    self.fetchAlert = [UIAlertController alertControllerWithTitle:@"Cannot Fetch Movies" message:@"An error occured." preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Button pressed");
        [self fetchMovies];
    }];
    [self.fetchAlert addAction:tryAgainAction];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    [self.moviesCollectionView insertSubview:self.refreshControl atIndex:0];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.moviesCollectionView.collectionViewLayout;
    
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    
    CGFloat postersPerLine = 4;
    CGFloat itemWidth = (self.moviesCollectionView.frame.size.width - layout.minimumInteritemSpacing * (postersPerLine - 1)) / postersPerLine;
    CGFloat itemHeight = itemWidth * 1.5;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
}

- (void) viewDidAppear:(BOOL)animated {
    [self fetchMovies];
    self.filteredMovies = self.movies;
}

- (void)fetchMovies {
    [self.activityIndicator startAnimating];
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               
               self.fetchAlert.message = [error localizedDescription];
               [self presentViewController:self.fetchAlert animated:YES completion:nil];
               
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

               self.movies = dataDictionary[@"results"];
               
               [self.moviesCollectionView reloadData];
           }
        
        [self.activityIndicator stopAnimating];
        [self.refreshControl endRefreshing];
       }];
    [task resume];

}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
    
    NSDictionary *movie = self.filteredMovies[indexPath.item];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    cell.posterView.image = nil;
    [cell.posterView setImageWithURL:posterURL];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filteredMovies.count;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText {
    if (searchText.length != 0) {
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSDictionary *evaluatedObject, NSDictionary *bindings) {
            return [evaluatedObject[@"title"] rangeOfString:searchText].location != NSNotFound;
        }];
        self.filteredMovies = [self.movies filteredArrayUsingPredicate:predicate];
    }
    else {
        self.filteredMovies = self.movies;
    }
    
    [self.moviesCollectionView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = NO;
    self.searchBar.text = @"";
    [self.searchBar resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UICollectionViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.moviesCollectionView indexPathForCell:tappedCell];
    NSDictionary *movie = self.filteredMovies[indexPath.row];
    
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.movie = movie;
}

@end
