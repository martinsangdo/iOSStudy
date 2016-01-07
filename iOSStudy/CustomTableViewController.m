//
//  CustomTableViewController.m
//  iOSStudy
//
//  Created by PC19 on 1/5/16.
//  Copyright (c) 2016 OrganizationName. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

NSMutableArray * singerList;
NSMutableArray * imageList;
NSMutableArray * descList;

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return singerList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CustomCell";//declared in .xib
    
    CustomTableViewCell *customCell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (customCell == nil){
        //initialize cell at the first time app launches
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil]; //*.xib filename
        /*
         in case of error in above line:
         http://stackoverflow.com/questions/3088059/what-does-this-mean-nsunknownkeyexception-reason-this-class-is-not-key
         
         */
        customCell = [nib objectAtIndex:0];
    }
    //assign value to cell
    customCell.cellSingerName.text = [singerList objectAtIndex:indexPath.row];
    customCell.cellImg.image = [UIImage imageNamed:[imageList objectAtIndex:indexPath.row]];
    customCell.cellDesc.text = [descList objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return customCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
