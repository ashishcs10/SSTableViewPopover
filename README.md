# SSTableViewPopover

## Usage
`#import "UITableView+Popover.h"`
`UITableView+Popover.h`is a category of UITableView.You can use it simply like:
```objective-c
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PopoverItem *item = [[PopoverItem alloc]initWithName:@"Item" image:[UIImage imageNamed:@"example.png"] selectedHandler:^(PopoverItem *popoverItem) {
        //handle callback
    }];
    PopoverItem *item1 = [[PopoverItem alloc]initWithName:@"Item1" image:[UIImage imageNamed:@"example1.png"] selectedHandler:^(PopoverItem *popoverItem) {
        //handle callback
    }];
    [tableView showPopoverWithItems:@[item,item1] forIndexPath:indexPath];
}

```

## License
The project is available under the MIT license.
