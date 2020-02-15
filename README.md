The Sales Taxes Problem

Basic sales tax is applicable at a rate of **10%** on all goods, except **books**, **food**, and **medical** products 
that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of **5%**, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with 
the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate
of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:

Test Data

Order 1:
1 book at 12.49
1 CD at 14.99
1 chocolate at 0.85

Order 2:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50

Order 3:
1 imported bottle of perfume at 27.99
1 perfume at 18.99
1 pill at 9.75
1 imported box of chocolates at 11.25

Output Data

Order 1:
1 book : 12.49
1 CD: 16.49
1 chocolate: 0.85
Sales Taxes: 1.50
Total: 29.83

Order 2:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

Order 3:
1 imported bottle of perfume: 32.19
1 perfume: 20.89
1 pill: 9.75
1 imported box of chocolates: 11.85
Sales Taxes: 6.70
Total: 74.68

