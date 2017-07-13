//
//  ExpertVedioTableViewCell.h
//  
//
//  Created by zhujp on 2017/6/7.
//
//

#import <UIKit/UIKit.h>


typedef void(^OpenVedioBtonBlock)(NSIndexPath *indexPath);


@interface ExpertVedioTableViewCell : UITableViewCell


@property (nonatomic,strong) UIImageView  *vedioImageView;
@property (nonatomic,copy) OpenVedioBtonBlock   block;
@property (nonatomic,strong) NSDictionary *dict;

- (void)videoCellWithTableView:(UITableView *)tableview WithIndexPath:(NSIndexPath *)indexpath;

@end
