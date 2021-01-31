// "Hello world" for Objective C

#import <Foundation/Foundation.h>

int main(void)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"Hello world.");
    [pool drain];
    return 0;
}
