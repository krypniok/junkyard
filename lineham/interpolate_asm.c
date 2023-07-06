typedef struct {
    float x;
    float y;
    float z;
} Point;

inline Point interpolate(const Point* p1, const Point* p2, float t) {
    Point result;
    __asm__ (
        "movaps (%1), %%xmm0\n\t"    // Load p1 into xmm0
        "subps (%2), %%xmm0\n\t"     // Subtract p2 from xmm0
        "mulps %3, %%xmm0\n\t"       // Multiply xmm0 by t
        "addps (%2), %%xmm0\n\t"     // Add p2 to xmm0
        "movaps %%xmm0, %0"          // Store xmm0 into result
        : "=m" (result)              // Output
        : "r" (p1), "r" (p2), "x" (t) // Input
        : "%xmm0"                    // Clobbered registers
    );
    return result;
}

