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
