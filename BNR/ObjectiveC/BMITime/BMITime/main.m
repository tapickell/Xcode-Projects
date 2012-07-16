//
//  main.m
//  BMITime
//
//  Created by Todd Pickell on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            Employee *person = [[Employee alloc] init];
            
            [person setWeightInKilos:96 + 1];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmployeeID:i];
            
            float bmi = [person bodyMassIndex];
            NSLog(@"Employee: %d (%d, %.2f) has a BMI of %.2f",[person employeeID], [person weightInKilos], [person heightInMeters], bmi);
            
            [employees addObject:person];
            
            if (i == 0) {
                [executives setObject:person forKey:@"CEO"];
            }
            
            if (i == 1) {
                [executives setObject:person forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            Asset *asset = [[Asset alloc] init];
            
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            NSUInteger randomIndex = random() % [employees count];
            
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee  addAssetsObject:asset];
            [allAssets addObject:asset];
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        NSLog(@"executives: %@", executives);
        NSLog(@"Employees: %@", employees);
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        NSLog(@"Giving up ownership of array");
        executives = nil;
        allAssets = nil;
        employees = nil;
        
    }
    sleep(100);
    return 0;
}

