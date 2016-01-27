# SSTableViewPopover

## Usage

```objective-c

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PopoverItem *item = [[PopoverItem alloc]initWithName:@"Item" image:[UIImage imageNamed:@"example.png"] selectedHandler:^(PopoverItem *popoverItem) {
        
    }];
    PopoverItem *item1 = [[PopoverItem alloc]initWithName:@"Item1" image:[UIImage imageNamed:@"example1.png"] selectedHandler:^(PopoverItem *popoverItem) {
        
    }];
    [tableView showPopoverWithItems:@[item,item1] forIndexPath:indexPath];
}
```

## License
The project is available under the MIT license.
