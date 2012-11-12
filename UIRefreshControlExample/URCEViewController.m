//
//  URCEViewController.m
//  UIRefreshControlExample
//
//  Created by Evgeniy Mikholap on 11/7/12.
//  Copyright (c) 2012 Evgeniy Mikholap. All rights reserved.
//

#import "URCEViewController.h"

#define ONE_SECOND 1
#define START_ROWS 5

@implementation URCEViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   
   value = START_ROWS;
	[self setUpUIRefreshControl];
}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return value;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
   if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
   }
   
   cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row + 1];
   
   return cell;
}

- (void)setUpUIRefreshControl {
   // Create the refresh control
   UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
   
   // Set the action
   [refreshControl addTarget:self action:@selector(refreshControlRequest) forControlEvents:UIControlEventValueChanged];

   // Optional tint
   [refreshControl setTintColor:[UIColor blueColor]];
   
   // Assign control to the tableview
   [self setRefreshControl:refreshControl];
}

- (void)refreshControlRequest {
   value++;
   
   [self performSelector:@selector(updateTableView) withObject:nil afterDelay:ONE_SECOND];
}

- (void)updateTableView {
   [self.tableView reloadData];
   [self.refreshControl endRefreshing];
}

@end
