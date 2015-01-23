//
//  PhotosViewController.m
//  InstagramClient
//
//  Created by Xiangnan Xu on 1/22/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotoCell.h"
#import "UIImageView+AFNetworking.h"

@interface PhotosViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *photoDict;
@property (strong, nonatomic) NSArray *imageURLs;

@end

@implementation PhotosViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=504fe596e76a41efa5fe1173f3fe09a2"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.photoDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.imageURLs = [self.photoDict valueForKeyPath:@"data.images.standard_resolution.url"];
        [self.tableView reloadData];
    }];
    
    UINib *imageCellNib = [UINib nibWithNibName:@"PhotoCell" bundle:nil];
    [self.tableView registerNib:imageCellNib forCellReuseIdentifier:@"PhotoCellIdentifier"];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 320;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageURLs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoCellIdentifier" forIndexPath:indexPath];
    NSString *imageLink = self.imageURLs[indexPath.row];
    NSLog(@"%@", imageLink);
    [cell.thumbnailView setImageWithURL:[NSURL URLWithString:imageLink]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
