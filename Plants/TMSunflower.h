//
//  TMSunflower.h
//  Plants
//
//  Created by Admin on 04.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPlant.h"

@interface TMSunflower : TMPlant
@property (nonatomic, readonly) UInt maxHealth;
@property (nonatomic, readonly) UInt health;
@property (nonatomic, readonly) UInt damage;
@property (nonatomic, copy) NSString* name;

-(void)dazzlingMode;//Атакований ворог засліплений і проходить лише частина контратаки. Зменшуэться власний урон.
-(void)superRecovery;//Відновлення на 45 одиниць свого здоров'я(лише один раз).
-(void)recoveryHealthOfObject:(TMPlant*)obj;//Відновлення здоров'я обєкту
@end
