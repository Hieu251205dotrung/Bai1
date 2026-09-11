#define RCC_APB2ENR   (*(volatile unsigned int *)0x40021018)

#define GPIOA_CRL     (*(volatile unsigned int *)0x40010800)
#define GPIOA_ODR     (*(volatile unsigned int *)0x4001080C)

void delay_ms(unsigned int ms)
{
    for (volatile unsigned int i = 0; i < ms; i++)
    {
        for (volatile unsigned int j = 0; j < 800000; j++)
        {
        }
    }
}

int main(void)
{
    // Bật clock GPIOA
    RCC_APB2ENR |= (1 << 2);

    // PA0 = output push-pull, 2 MHz
    GPIOA_CRL &= ~(0xF << 0);
    GPIOA_CRL |= (0x2 << 0);

    while (1)
    {
        GPIOA_ODR |= (1 << 0);     // LED sáng
        delay_ms(1000);

        GPIOA_ODR &= ~(1 << 0);    // LED tắt
        delay_ms(1000);
    }
}
