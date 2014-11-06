//
//  TMPearshooter.h
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPlant.h"

@interface TMPearshooter : TMPlant
-(void)fireMode;//Збильшення урону але при атаці зменшуються здоров'я на 1/3 від урону
-(void)machineGunAttack:(TMPlant*)obj;//П'ятикратна атака з імовірністю 50/50 кожного попадання(одноразова). Неможлива в fireMode
-(void)increaseDamageOfObject:(TMPlant*)obj;//Збільшує уроб об'єкта, втрачаючи здоров'я (одноразова).
@end
