                .syntax     unified
                .cpu        cortex-m4
                .text
                .thumb_func
                .align      2

// int Modulus(int number, int divisor) ;

                .global     Modulus
Modulus:        SDIV        R2,R0,R1        //R2 <- number / divisor
                MLS         R0,R2,R1,R0     //R0 <- number - divisor * (number / divisor)
                ADD         R0,R0,R1        //R0 <- (number % divisor) + divisor
                SDIV        R2,R0,R1        //R2 <- ((number % divisor) + divisor) / divisor
                MLS         R0,R2,R1,R0     //R0 <- ((number % divisor) + divisor) - divisor * (((number % divisor) + divisor) / divisor)
                BX          LR
                .end

