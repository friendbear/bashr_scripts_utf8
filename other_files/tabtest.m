    // Fill the interior of the rect
    NSRectFill(NSMakeRect(bounds.origin.x + r,
                            bounds.origin.y + r,
                            bounds.origin.x + bounds.size.width - 2*r,
                            bounds.origin.y + bounds.size.height - 2*r));
