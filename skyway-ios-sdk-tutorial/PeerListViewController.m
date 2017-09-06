//
// PeerListViewController.m
//  eclwebrtc-ios-sdk-tutorial
//
//  Created by xxxxx on xxxx/xx/xx.
//  Copyright © xxxx年 xxxxx. All rights reserved.
//

#import "PeerListViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface PeerListViewController ()

@end


@implementation PeerListViewController

@synthesize tableView = _tableView;
@synthesize items = _items;

- (instancetype)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];
	_items = nil;
	return self;
}

- (void)dealloc {
	self.items = nil;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[_tableView setAllowsSelection:YES];
	[_tableView setAllowsMultipleSelection:NO];
	
	self.navigationItem.title = @"Select Target's PeerID";

	UIBarButtonItem* bbiBack = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
	self.navigationItem.leftBarButtonItem = bbiBack;
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ITEMS"];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	[_tableView setDelegate:nil];
	[_tableView setDataSource:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (nil == _items) {
		return 0;
	}
	
	return (NSInteger)_items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString* CellIdentifier = @"ITEMS";
    
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (nil == cell) {
		cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		[cell setSeparatorInset:UIEdgeInsetsZero];
	}

	if (nil != _items) {
		NSInteger iRow = indexPath.row;
		if (_items.count > iRow) {
			NSString* strItem = [_items objectAtIndex:iRow];
			[cell.textLabel setText:strItem];
		}
	}
	
	return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* strTo = [_items objectAtIndex:indexPath.row];
    [self.delegate didSelectPeer:strTo];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
