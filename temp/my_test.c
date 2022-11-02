/*
** EPITECH PROJECT, 2022
** Title: my_test.c
** File description:
** <------------------------------------------->
** Made by         : matthieu1.martin@epitech.eu
** Creation date   : 02/11/2022 at 11:40:33
*/
#include "include/my.h"
#include "include/my_printf.h"
#include <stdarg.h>

void my_put_octal(va_list list)
{
    unsigned int len, pow, j, digit, n, num;
    int count = 0;
    n = va_arg(list, unsigned int);
    if (n != 0) {
        num = n;
        len = 0;
        while (num != 0) {
            num /= 8;
            len++;
        }
        pow = 1;
        for (j = 1; j < len -1; j++)
            pow *= 8;
        for (j = 1; j < len; j++) {
            digit = n / pow;
            my_putchar(digit + '0');
            count++;
            n -= (digit * pow);
            pow /= 8;
        }
    } else {
        my_putchar('0');
        return (1);
    }
    return (count);
}
