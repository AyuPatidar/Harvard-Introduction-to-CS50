#include "helpers.h"
#include<stdio.h>
#include<math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = round((image[i][j].rgbtRed + image[i][j].rgbtBlue + image[i][j].rgbtGreen) / 3.0);
            image[i][j].rgbtBlue = image[i][j].rgbtRed;
            image[i][j].rgbtGreen = image[i][j].rgbtRed;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    float r, g, b;
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            r = image[i][j].rgbtRed;
            g = image[i][j].rgbtGreen;
            b = image[i][j].rgbtBlue;
            if (round((0.393 * r) + (0.769 * g) + (0.189 * b)) > 255)
            {
                image[i][j].rgbtRed = 255;
            }
            else
            {
                image[i][j].rgbtRed = round((0.393 * r) + (0.769 * g) + (0.189 * b));
            }
            if (round((0.349 * r) + (0.686 * g) + (0.168 * b)) > 255)
            {
                image[i][j].rgbtGreen = 255;
            }
            else
            {
                image[i][j].rgbtGreen = round((0.349 * r) + (0.686 * g) + (0.168 * b));
            }
            if (round((0.272 * r) + (0.534 * g) + (0.131 * b)) > 255)
            {
                image[i][j].rgbtBlue = 255;
            }
            else
            {
                image[i][j].rgbtBlue = round((0.272 * r) + (0.534 * g) + (0.131 * b));
            }
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    int tr, tg, tb;
    for (int i = 0; i < (height); i++)
    {
        for (int j = 0; j < (width / 2); j++)
        {
            tr = image[i][j].rgbtRed;
            tg = image[i][j].rgbtGreen;
            tb = image[i][j].rgbtBlue;
            image[i][j].rgbtRed = image[i][width - j - 1].rgbtRed;
            image[i][j].rgbtGreen = image[i][width - j - 1].rgbtGreen;
            image[i][j].rgbtBlue = image[i][width - j - 1].rgbtBlue;
            image[i][width - j - 1].rgbtRed = tr;
            image[i][width - j - 1].rgbtGreen = tg;
            image[i][width - j - 1].rgbtBlue = tb;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE tmp[height][width];
    float sr = 0, sg = 0, sb = 0, c = 0;
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            for (int k = -1; k < 2; k++)
            {
                if (i + k < 0 || i + k > height - 1)
                {
                    continue;
                }
                for (int h = -1; h < 2; h++)
                {
                    if (j + h < 0 || j + h > width - 1)
                    {
                        continue;
                    }
                    sr += image[i + k][j + h].rgbtRed;
                    sg += image[i + k][j + h].rgbtGreen;
                    sb += image[i + k][j + h].rgbtBlue;
                    c++;
                }
            }
            tmp[i][j].rgbtRed = round(sr / c);
            tmp[i][j].rgbtGreen = round(sg / c);
            tmp[i][j].rgbtBlue = round(sb / c);
            sr = sg = sb = c = 0;
        }
    }
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = tmp[i][j].rgbtRed;
            image[i][j].rgbtGreen = tmp[i][j].rgbtGreen;
            image[i][j].rgbtBlue = tmp[i][j].rgbtBlue;
        }
    }
    return;
}