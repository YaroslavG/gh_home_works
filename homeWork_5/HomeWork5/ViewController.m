//
//  ViewController.m
//  HomeWork5
//
//  Created by Yaroslav Gorkun on 17.11.14.
//  Copyright (c) 2014 yaroslav Horkun. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()<UITableViewDataSource> {

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	//Инициализация массива на пряму не до пропертей а до змінних можна замінити на self.
    _fielders = [[NSArray alloc] initWithObjects:
                 @"Iker Casillas",
                 @"Manuel Nouer",
                 @"David de Hea",
                 @"Tibo Kurtua",
                 @"Andrew Pyatov",
                 nil];
	_goalkeepers = [[NSArray alloc] initWithObjects:
                    @"Tomas Muller",
                    @"Robin van Persi",
                    @"Eden Azar",
                    @"Serhio Ramos",
                    @"Luis Adriano",
                    nil];


	//Додаєм програмну
	[self addTableView];
}
- (void) addTableView {
	_codeTable = [[UITableView alloc] init];
	CGRect halfFrame = self.view.frame;
	halfFrame.size.width = halfFrame.size.width/2;
	halfFrame.origin.x = halfFrame.size.width;
	_codeTable.frame = halfFrame;
	_codeTable.dataSource = self;
	
	[self.view addSubview:_codeTable];
}

- (NSArray *) arrayForTableView:(UITableView *)table {
    if (table == _codeTable) {
		return _goalkeepers;

	}
	return _fielders;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	//тут ми не знаєм ще показувать байки чи машини значить треба узнать яка тейбл вю питає селл щоб вернуть правельний еррей
	NSArray *array = [self arrayForTableView:tableView];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

	//тут ми не знаєм ще показувать байки чи машини значить треба узнать яка тейбл вю питає селл щоб вернуть правельний еррей
	NSArray *array = [self arrayForTableView:tableView];

    
	cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}
//

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _codeTable) {
        return @"Players";
    }
    return @"Goalkeepers";
}

@end
