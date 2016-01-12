//
//  MultiSectionTableViewController.m
//  iOSStudy
//
//  Created by PC19 on 1/7/16.
//  Copyright (c) 2016 OrganizationName. All rights reserved.
//

#import "MultiSectionTableViewController.h"

@interface MultiSectionTableViewController ()

@end

@implementation MultiSectionTableViewController
NSMutableArray * singerList;
NSMutableArray * imageList;
NSMutableArray * descList;

NSMutableArray * resultList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initData];
}
//init predefined data
- (void) initData{
    singerList = [[NSMutableArray alloc] initWithObjects:@"che linh", @"thanh tuyen", @"truong vu", nil];
    imageList = [[NSMutableArray alloc] initWithObjects:@"images1.jpeg", @"images2.jpeg", @"tree-oak.jpg", nil];
    descList = [[NSMutableArray alloc] initWithObjects:@"que goc o Phan rang", @"que o Da lat", @"goc nguoi Hoa", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
//    return 3;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
//    switch (section) {
//        case 0:
//            return singerList.count;
//            break;
//        case 1:
//            return imageList.count;
//            break;
//        case 2:
//            return descList.count;
//            break;
//    };
    
    if (tableView ==self.searchDisplayController.searchResultsTableView){
        return resultList.count;
    } else {
        return singerList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CustomCell";//must declare in .xib
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    // Configure the cell...
//    switch (indexPath.section) {
//        case 0:
//            cell.textLabel.text = [singerList objectAtIndex:indexPath.row];
//            break;
//        case 1:
//            cell.textLabel.text = [imageList objectAtIndex:indexPath.row];
//            break;
//        case 2:
//            cell.textLabel.text = [descList objectAtIndex:indexPath.row];
//            break;
//    };
    // Configure the cell...
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    
        if (tableView ==self.searchDisplayController.searchResultsTableView && indexPath.row >= 0&& resultList.count > 0){
            cell.textLabel.text = [resultList objectAtIndex:indexPath.row];
        } else {
            cell.textLabel.text = [singerList objectAtIndex:indexPath.row];
        }
    resultList = [NSMutableArray arrayWithCapacity:[singerList count]];
    
    return cell;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *titleName;
    switch (section) {
        case 0:
            titleName = @"Singer name";
            break;
        case 1:
            titleName = @"Image list";
            break;
        case 2:
            titleName = @"Desc list";
            break;
    }
    return titleName;
}
- (void)filterContent:(NSString*)keyword scope:(NSString*)scope{
    [resultList removeAllObjects];      //reset data
    NSPredicate * resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", keyword];
    resultList = [NSMutableArray arrayWithArray:[singerList filteredArrayUsingPredicate:resultPredicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContent:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
