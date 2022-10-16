/*
** EPITECH PROJECT, 2022
** MY_PUT_NBR
** File description:
** putnbr
*/

int my_put_nbr(int nb)
{
    int i;
    int j;

    if (nb < 0) {
        my_putchar('-');
        my_put_nbr(-nb);
    } else {
        j = nb % 10;
        i = nb / 10;
        if (i != 0) {
            my_put_nbr(i);
        }
        my_putchar(j + '0');
    }
}
