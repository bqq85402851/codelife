//
//  SqliteVC.m
//  InterViewAll
//
//  Created by 英策网络科技 on 16/9/8.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//  https://github.com/ccgus/fmdb

#import "SqliteVC.h"
#import "FMDB.h"
@interface SqliteVC()
{
    UITextField*textField;
    UITextView*textView;
}
@end
@implementation SqliteVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    textField=[[UITextField alloc]initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, 50)];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    textView=[[UITextView alloc]initWithFrame:CGRectMake(50, 350,self.view.bounds.size.width-100 , 300)];
    [self.view addSubview:textView];
    
    NSArray*arr=@[@"增",@"删",@"改",@"查"];
    for (int i=0; i<arr.count; i++) {
        UIButton*btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(50+i*((self.view.bounds.size.width-100)/arr.count), CGRectGetMaxY(textField.frame), (self.view.bounds.size.width-100)/arr.count, 50);
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=100+i;
        [self.view addSubview:btn];
    }
    
//    NSString*path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    path=[path stringByAppendingString:@"test.sqlite"];
//    //创建||打开数据库
//    FMDatabase*dataBase=[FMDatabase databaseWithPath:path];
//    if ([dataBase open]) {
//        NSLog(@"数据库打开");
//    }
//    //创建表
//    //create table if not exists t_user(id integer autoincrement primary key,name varchar)
//    NSString*create1=@"create table if not exists t_user(id integer primary key autoincrement,name varchar)";
//    if ([dataBase executeUpdate:create1]) {
//        NSLog(@"创建表成功");
//    }
//    
//    //插入
//    NSString*insertSql=@"insert into t_user(id,name) values(?,?)";
//    if ([dataBase executeUpdate:insertSql,@(1),@"admin"]) {
//        NSLog(@"admin插入成功");
//    }
//    if ([dataBase executeUpdate:@"insert into t_user(name) values(?)",@"zhangsan"]) {
//        NSLog(@"张三插入成功");
//    }
//    if ([dataBase executeUpdateWithFormat:@"insert into t_user(name) values(%@)",@"wangwu"]) {
//        NSLog(@"王五插入成功");
//    }
//    //删除
//    NSString*delStr=@"delete from t_user where id=?";
//    if ([dataBase executeUpdate:delStr,@(1)]) {
//        NSLog(@"删除成功");
//    }
//    //修改
//    NSString*updateStr=@"update t_user set name=? where name=?";
//    if ([dataBase executeUpdate:updateStr,@"lisi",@"zhangsan"]) {
//        NSLog(@"修改成功");
//    }
//    
//    NSString*sql=@"select * from t_user";
//    FMResultSet*result=[dataBase executeQuery:sql];
//    while (result.next) {
//        int ins=[result intForColumn:@"id"];
//        NSString*name=[result stringForColumn:@"name"];
//        NSLog(@"%d %@",ins,name);
//    }
    /**
     intForColumn:
     longForColumn:
     longLongIntForColumn:
     boolForColumn:
     doubleForColumn:
     stringForColumn:
     dateForColumn:
     dataForColumn:
     dataNoCopyForColumn:
     UTF8StringForColumnName:
     objectForColumnName:
     */
//    if ([dataBase close]) {
//        NSLog(@"数据库关闭");
//    }
}
-(void)clickEvent:(UIButton*)sender{
    if (textField.text.length==0) {
        UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"请输入" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
        return;
    }
    switch (sender.tag-100) {
        case 0:
            //增
            if ([self insertDataWithName:textField.text]) {
                UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"插入成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alter show];
            }
            break;
        case 1:
            //删
            if ([self deleteDataAtObject:@[textField.text]]) {
                UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"删除成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alter show];
            }
            break;
        case 2:
            //改
            if ([self setDataAtObject:@[@(2)] newValue:textField.text]) {
                UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"修改成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alter show];
            }
            break;
        case 3:
            //查
            [self selectData];
            break;
        default:
            break;
    }
}
//插
-(BOOL)insertDataWithName:(NSString*)name{
    NSString*path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingString:@"test.sqlite"];
    FMDatabaseQueue*baseQueue=[FMDatabaseQueue databaseQueueWithPath:path];
    __block BOOL result=NO;
    [baseQueue inDatabase:^(FMDatabase *db) {
        if ([db executeUpdateWithFormat:@"insert into t_user(name) values(%@)",name]) {
            NSLog(@"插入%@成功",name);
            result=YES;
        }
    }];
    return result;
}
//删
-(BOOL)deleteDataAtObject:(NSArray*)array{
    NSString*path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingString:@"test.sqlite"];
    FMDatabaseQueue*baseQueue=[FMDatabaseQueue databaseQueueWithPath:path];
    __block BOOL result=NO;
    [baseQueue inDatabase:^(FMDatabase *db) {
        for (int i=0; i<array.count; i++) {
            id var=array[i];
            if (sizeof(var)==2) {
                if ([db executeUpdateWithFormat:@"delete from t_user where id=%d",(int)var]) {
                    result=YES;
                }
            }else if ([var isKindOfClass:[NSString class]]){
                if ([db executeUpdateWithFormat:@"delete from t_user where name=%@",var]) {
                    result=YES;
                }
            }else{
                result=NO;
            }
        }
    }];
    return result;
}
//改
-(BOOL)setDataAtObject:(NSArray*)arr newValue:(NSString*)value{
    NSString*path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingString:@"test.sqlite"];
    FMDatabaseQueue*baseQueue=[FMDatabaseQueue databaseQueueWithPath:path];
    __block BOOL result=NO;
    [baseQueue inDatabase:^(FMDatabase *db) {
        for (int i=0; i<arr.count; i++) {
            if ([db executeUpdateWithFormat:@"update t_user set name=%@ where id=2",value]) {
                    result=YES;
                }
        }
    }];
    return result;
}
//查
-(void)selectData{
    NSString*path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingString:@"test.sqlite"];
    FMDatabaseQueue*baseQueue=[FMDatabaseQueue databaseQueueWithPath:path];
    [baseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet*set=[db executeQuery:@"select * from t_user"];
        NSString*str=@"查询内容为:\r";
        while ([set next]) {
            int idValue=[set intForColumn:@"id"];
            NSString*name=[set stringForColumn:@"name"];
           str=[str stringByAppendingString:[NSString stringWithFormat:@"%d : %@\r",idValue,name]];
        }
        textView.text=str;
    }];
}
@end
