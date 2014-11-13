//
//  TMWallNut.h
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPlant.h"

@interface TMWallNut : TMPlant
-(void)defenseMode;//Збільшення вдвічі Health і MaxHealth. Не може атакувати, ліше контратака.
-(void)shotgunAttack:(TMPlant*)obj;//Одноразова атака подвійною силою
-(void)increaseMaxHealthOfObject:(TMPlant*)obj;//Одноразове збільшення на 25 одиніць MaxHealth і Health об'єкта, за рахунок зменшення власного на 50 одиниць
@end
