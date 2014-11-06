//
//  main.m
//  Plants
//
//  Created by Admin on 04.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TMSunflower.h"
#import "TMChomper.h"
#import "TMPearshooter.h"
#import "TMWallNut.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TMSunflower* Sunflower=[[TMSunflower alloc]initWithName:@"Sunflower"];
        TMChomper* Chomper=[[TMChomper alloc]initWithName:@"Chomper"];
        TMPearshooter* Pearshooter=[[TMPearshooter alloc]initWithName:@"Pearshooter"];
        TMWallNut* WallNut=[[TMWallNut alloc]initWithName:@"WallNut"];
        
        [Sunflower attack:Chomper];
        [Chomper attack:Pearshooter];
        [WallNut shotgunAttack:Chomper];
        [Pearshooter machineGunAttack:WallNut];
        
        [Sunflower dazzlingMode];
        [Chomper attack:Sunflower];
        [WallNut increaseMaxHealthOfObject:Sunflower];
        [Pearshooter fireMode];
        
        [Sunflower attack:Pearshooter];
        [Chomper devourMode];
        [WallNut defenseMode];
        [Pearshooter attack:WallNut];;
        
        [Sunflower recoveryHealthOfObject:WallNut];
        [Chomper attack:WallNut];
        [WallNut increaseMaxHealthOfObject:Sunflower];
        [Pearshooter increaseDamageOfObject:Chomper];
        
        [Sunflower attack:Pearshooter];
        [Chomper explosionObject:Sunflower];
        [WallNut attack:Sunflower];
        [Pearshooter attack:Sunflower];
        
        [Sunflower superRecovery];
        [Chomper attack:Sunflower];
        [WallNut attack:Sunflower];
        [Pearshooter attack:Sunflower];
        
        NSLog(@"%@",Sunflower);
        NSLog(@"%@",Chomper);
        NSLog(@"%@",WallNut);
        NSLog(@"%@",Pearshooter);
        
    }
    return 0;
}