//
//  TMChomper.h
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPlant.h"

@interface TMChomper : TMPlant
-(void)devourMode;//Режим в якому Chomper пожерає обект (убиває) але після цього не може атакувати (лише один раз вмикається)
-(void)explosionObject:(TMPlant*)obj;//Взривається і наносить 75 одиниць урону.
-(void)giveHealthToObject:(TMPlant*)obj;//Відновлює здоров'я об'єкту за рахунок свого.
@end
