.syntax unified
.cpu cortex-m3
.thumb

.global _estack
.global Reset_Handler
.global main

.section .isr_vector, "a", %progbits
.word _estack
.word Reset_Handler

.section .text.Reset_Handler
.thumb_func
.type Reset_Handler, %function

Reset_Handler:
    bl main

Loop:
    b Loop

.size Reset_Handler, .-Reset_Handler

