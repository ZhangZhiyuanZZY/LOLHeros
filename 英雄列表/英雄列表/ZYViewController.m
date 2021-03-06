//
//  ViewController.m
//  英雄列表
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYHero.h"

@interface ZYViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)NSArray *heros;
@property(nonatomic, strong)UITableView *tableVlew;
@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSeparator];
}

//设置tableView的属性样式
- (void)setupSeparator
{
    //1.设置颜色
    [self.tableVlew setSeparatorColor:[UIColor blueColor]];
    //2.设置样式
    [self.tableVlew setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    //3.设置行高
    self.tableVlew.rowHeight = 60;
    //4.添加head/ footer
    self.tableVlew.tableHeaderView = [[UISwitch alloc]init];
    self.tableVlew.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
}

#pragma mark - tabelView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYHero *hero = self.heros[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"what"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"waht"];
    }
    
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    NSString *imgString = hero.icon;
    cell.imageView.image = [UIImage imageNamed:imgString];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"bg"];
    
    
    //设置背景图片
    cell.backgroundView = imageView;
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYHero *hero = self.heros[indexPath.row];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"难道美丽也是一种罪?" message:@"罗特斯" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"勇士!" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"DNF" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里要拿到文本框中的内容,  并且显示到cell上
        UITextField *textField =  alertController.textFields.firstObject;
        hero.name = textField.text;
        [self.tableVlew reloadData];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = hero.name;
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 懒加载
- (NSArray *)heros
{
    if (!_heros) {
        _heros = [[NSArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *arrayHeros = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayHeros) {
            ZYHero *hero = [[ZYHero alloc]initWithDict:dict];
            [arrayM addObject:hero];
        }
        _heros = arrayM;
    }
    return _heros;
}

- (UITableView *)tableVlew
{
    if (!_tableVlew) {
        _tableVlew = [[UITableView alloc]init];
        _tableVlew.frame = self.view.bounds;
        self.tableVlew.dataSource = self;
        self.tableVlew.delegate = self;
        self.tableVlew = _tableVlew;
        [self.view addSubview:_tableVlew];
    }
    return _tableVlew;
}
@end
