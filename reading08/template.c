/* Reading 08 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* Constants */

#define KB		// TODO: Define Kilobyte
#define SEGMENT_MASK	// TODO: Define Bitmask for Segment portion of Virtual Address
#define SEGMENT_SHIFT	// TODO: Define Bitshift amount for Segment portion of Virtual Address
#define OFFSET_MASK	// TODO: Define Bitmask for Offset portion of Virtual Address

/* Structures */

typedef struct {
    int16_t base;
    int16_t size;
} SegmentRecord;

/* Constants */

SegmentRecord MMU[] = {	// Segmentation Table stored in MMU
    {.base = 32*KB, .size = 2*KB},   /* 00: Code  */
    {.base = 34*KB, .size = 2*KB},   /* 01: Data  */
    {.base = 36*KB, .size = 2*KB},   /* 10: Heap  */
    {.base = 28*KB, .size = 2*KB},   /* 11: Stack */
};

int main(int argc, char *argv[]) {
    int16_t virtual_address;

    while (fread(&virtual_address, sizeof(int16_t), 1, stdin)) {
    	int16_t segment	= // TODO: Determine segment using SEGMENT_MASK and SEGMENT_SHIFT
    	int16_t offset	= // TODO: Determine offset using OFFSET_MASK

    	char *fault = "";
	if () { // TODO: Perform bounds checking using MMU and offset
	    fault = " Segmentation Fault";
	}

	int16_t physical_address = // TODO: Compute physical address using MMU and offset
	printf("VA[%04hx] -> PA[%04hx]%s\n", virtual_address, physical_address, fault);
    }

    return EXIT_SUCCESS;
}
