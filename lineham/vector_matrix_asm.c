typedef struct {
    float x;
    float y;
    float z;
} Vector3;

inline Vector3 addVectors(const Vector3* v1, const Vector3* v2) {
    Vector3 result;
    __asm__ volatile (
        "movups (%1), %%xmm0\n"
        "addps (%2), %%xmm0\n"
        "movups %%xmm0, (%0)"
        : "=r"(&result)
        : "r"(v1), "r"(v2)
        : "xmm0"
    );
    return result;
}

inline Vector3 multiplyVectors(const Vector3* v1, const Vector3* v2) {
    Vector3 result;
    __asm__ volatile (
        "movups (%1), %%xmm0\n"
        "mulps (%2), %%xmm0\n"
        "movups %%xmm0, (%0)"
        : "=r"(&result)
        : "r"(v1), "r"(v2)
        : "xmm0"
    );
    return result;
}

typedef struct {
    float m[4][4];
} Matrix4;

inline Matrix4 multiplyMatrices(const Matrix4* m1, const Matrix4* m2) {
    Matrix4 result;
    __asm__ volatile (
        "movups (%1), %%xmm0\n"
        "movups (%2), %%xmm1\n"
        "movups (%3), %%xmm2\n"
        "movups (%4), %%xmm3\n"
        "movups (%5), %%xmm4\n"
        "movups (%6), %%xmm5\n"
        "movups (%7), %%xmm6\n"
        "movups (%8), %%xmm7\n"

        "mulps %%xmm1, %%xmm0\n"
        "mulps %%xmm3, %%xmm2\n"
        "mulps %%xmm5, %%xmm4\n"
        "mulps %%xmm7, %%xmm6\n"

        "addps %%xmm2, %%xmm0\n"
        "addps %%xmm6, %%xmm4\n"

        "movups %%xmm0, (%0)\n"
        "movups %%xmm4, 16(%0)\n"
        "movups %%xmm0, 32(%0)\n"
        "movups %%xmm4, 48(%0)"
        : "=r"(&result)
        : "r"(&m1->m[0][0]), "r"(&m1->m[1][0]), "r"(&m1->m[2][0]), "r"(&m1->m[3][0]),
          "r"(&m2->m[0][0]), "r"(&m2->m[1][0]), "r"(&m2->m[2][0]), "r"(&m2->m[3][0])
        : "xmm0", "xmm1", "xmm2", "xmm3", "xmm4", "xmm5", "xmm6", "xmm7"
    );
    return result;
}


