/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include "cachelab.h"
#include <stdio.h>

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
  int i, j, k1, k2, tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

  //case 1
  // Instead of process one integer at a time, because the system will
  // also fetch nearby data at the same time, we can process more integer at a time,
  // utilizing cache and generate faster result.
  // Because cache block size is 32 bytes, which can contain 8 integer,
  // so we move 8 integer at a time.
  if (N == 32)
  {
    for (k1 = 0; k1 < M; k1 += 8)
    {
      for (k2 = 0; k2 < M; k2 += 8)
      {
        for (i = 0; i < 8; i++)
        {
          tmp0 = A[k1 + i][k2];
          tmp1 = A[k1 + i][k2 + 1];
          tmp2 = A[k1 + i][k2 + 2];
          tmp3 = A[k1 + i][k2 + 3];
          tmp4 = A[k1 + i][k2 + 4];
          tmp5 = A[k1 + i][k2 + 5];
          tmp6 = A[k1 + i][k2 + 6];
          tmp7 = A[k1 + i][k2 + 7];
          B[k2][k1 + i] = tmp0;
          B[k2 + 1][k1 + i] = tmp1;
          B[k2 + 2][k1 + i] = tmp2;
          B[k2 + 3][k1 + i] = tmp3;
          B[k2 + 4][k1 + i] = tmp4;
          B[k2 + 5][k1 + i] = tmp5;
          B[k2 + 6][k1 + i] = tmp6;
          B[k2 + 7][k1 + i] = tmp7;
        }
      }
    }
  }
  // Case 2
  // Process using 4 blocks.
  /*First store A column in the bottom left corner of A with four variables.
    *Use four more variables to store the row in the upper right corner of B.
    *Moves A column in the bottom left corner of A to A row in the top right corner of B in the four variable stores
    *Shift the top right row of B in the four variable stores to the bottom left column of B
    *The lower right corner of B is equal to the lower right corner of A transpose
    */
  else if (N == 64)
  {
    for (k1 = 0; k1 < N; k1 += 8)
    {
      for (k2 = 0; k2 < M; k2 += 8)
      {
        for (i = k1; i < k1 + 4; i++)
        {
          tmp0 = A[i][k2];
          tmp1 = A[i][k2 + 1];
          tmp2 = A[i][k2 + 2];
          tmp3 = A[i][k2 + 3];
          tmp4 = A[i][k2 + 4];
          tmp5 = A[i][k2 + 5];
          tmp6 = A[i][k2 + 6];
          tmp7 = A[i][k2 + 7];

          B[k2][i] = tmp0;
          B[k2 + 1][i] = tmp1;
          B[k2 + 2][i] = tmp2;
          B[k2 + 3][i] = tmp3;

          B[k2][i + 4] = tmp4;
          B[k2 + 1][i + 4] = tmp5;
          B[k2 + 2][i + 4] = tmp6;
          B[k2 + 3][i + 4] = tmp7;
        }
        for (j = k2 + 4; j < k2 + 8; j++)
        {

          tmp4 = A[k1 + 4][j - 4]; // A left-down col
          tmp5 = A[k1 + 5][j - 4];
          tmp6 = A[k1 + 6][j - 4];
          tmp7 = A[k1 + 7][j - 4];

          tmp0 = B[j - 4][k1 + 4]; // B right-tmpbove line
          tmp1 = B[j - 4][k1 + 5];
          tmp2 = B[j - 4][k1 + 6];
          tmp3 = B[j - 4][k1 + 7];

          B[j - 4][k1 + 4] = tmp4; // set B right-tmpbove line
          B[j - 4][k1 + 5] = tmp5;
          B[j - 4][k1 + 6] = tmp6;
          B[j - 4][k1 + 7] = tmp7;

          B[j][k1] = tmp0; // set B left-down col
          B[j][k1 + 1] = tmp1;
          B[j][k1 + 2] = tmp2;
          B[j][k1 + 3] = tmp3;

          B[j][k1 + 4] = A[k1 + 4][j];
          B[j][k1 + 5] = A[k1 + 5][j];
          B[j][k1 + 6] = A[k1 + 6][j];
          B[j][k1 + 7] = A[k1 + 7][j];
        }
      }
    }
  }

  // Case 3
  // By the method used in 32 x 32, and changing the stepping,
  // we can find out that processing 16 integer at a time works the best
  else
  {
    for (k1 = 0; k1 < N; k1 += 16)
    {
      for (int k2 = 0; k2 < M; k2 += 16)
      {
        for (int i = k1; i < k1 + 16 && i < N; i++)
        {
          for (int j = k2; j < k2 + 16 && j < M; j++)
          {
            B[j][i] = A[i][j];
          }
        }
      }
    }
  }
  return;
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
  int i, j, tmp;

  for (i = 0; i < N; i++)
  {
    for (j = 0; j < M; j++)
    {
      tmp = A[i][j];
      B[j][i] = tmp;
    }
  }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
  /* Register your solution function */
  registerTransFunction(transpose_submit, transpose_submit_desc);

  /* Register any additional transpose functions */
  registerTransFunction(trans, trans_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
  int i, j;

  for (i = 0; i < N; i++)
  {
    for (j = 0; j < M; ++j)
    {
      if (A[i][j] != B[j][i])
      {
        return 0;
      }
    }
  }
  return 1;
}