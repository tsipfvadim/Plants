//
//  TMPearshooter.m
//  Plants
//
//  Created by Admin on 05.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMPearshooter.h"

@implementation TMPearshooter{
    BOOL _fire;
    UInt _machineGunCoun;
    UInt _increaseDamageCoun;
}
-(instancetype)initWithName:(NSString*)name{
    self=[super init];
    if (self) {
        self.name=name;
        _maxHealth=95;
        _health=_maxHealth;
        _damage=20;
        _isDead=NO;
        _rHealth=10;
        _fire=NO;
        _machineGunCoun=0;
        _increaseDamageCoun=0;
    }
    return self;
}
-(void)fireMode{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (_fire){
        _fire=NO;
        _damage=20;
        NSLog(@"\n  %@ in Normal mode",self.name);
    }else{
        _fire=YES;
        _damage=30;
        NSLog(@"\n  %@ in Fire mode",self.name);
    }
}
-(void)attack:(TMPlant *)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't attack.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    if (_fire) {
        if (_health<=10) {
            _health=0;
            _isDead=YES;
        }else{_health-=10;}
    }
    SEL selector = NSSelectorFromString(@"attackedBy:");
    [obj performSelector:selector withObject:self];
    NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}
-(void)machineGunAttack:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't attack.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! Don't beat lying.",obj.name);
        return ;
    }
    if (_fire) {
        NSLog(@"\n  I can't do it in Fire mode.");
        return ;
    }
    if (_machineGunCoun>0) {
        NSLog(@"\n  machineGun can't be used twice!");
        return;
    }
    UInt damage=0;
    for (UInt i=0; i<5; i++) {
        if (arc4random_uniform(2)) {
            damage+=1;
        }
    }
    _damage*=damage;
    NSLog(@"\n  %d hit(s) with machineGun!",damage);
    SEL selector = NSSelectorFromString(@"attackedBy:");
    [obj performSelector:selector withObject:self];
    _machineGunCoun+=1;
    _damage=20;
        NSLog(@"\n  %@ attack %@\n  %@    %@",self.name,obj.name,obj,self);
}
-(void)increaseDamageOfObject:(TMPlant*)obj{
    if (_isDead) {
        NSLog(@"\n  %@ is Dead! I can't do it.",self.name);
        return ;
    }
    if (obj->_isDead) {
        NSLog(@"\n  %@ is Dead! I can't IncreaseDamage.",obj.name);
        return ;
    }
    if (_increaseDamageCoun>0) {
        NSLog(@"\n  IncreaseDamage can't be used twice!");
        return;
    }
    if (_health<=20) {
        NSLog(@"\n  %@ have only %d health. I can't do it.",self.name,self.health);
        return;
    }
    obj->_damage+=10;
    _health-=20;
    _increaseDamageCoun+=1;
    NSLog(@"\n  %@ IncreaseDamage %@",self,obj);
}
@end
