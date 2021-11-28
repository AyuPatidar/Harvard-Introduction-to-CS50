#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    // check the number of arguments
    if (argc != 2)
    {
        printf("Usage: ./recover image\n");
        return 1;
    }

    // Open file & check if successfully opened
    FILE *file = fopen(argv[1], "r");
    if (file == NULL)
    {
        printf("Could not open file.");
        return 1;
    }

    //creating variables
    FILE *img;
    char filename[7];
    unsigned char *bf = malloc(512);
    int counter = 0;
    //Start reading file until the end
    while (fread(bf, 512, 1, file))
    {
        // Check if new JPEG is found
        if (bf[0] == 0xff && bf[1] == 0xd8 && bf[2] == 0xff && (bf[3] & 0xf0) == 0xe0)
        {
            //Close previous JPEG if it exists
            if (counter > 0)
            {
                fclose(img);
            }

            // Create filename
            sprintf(filename, "%03d.jpg", counter);
            // Open image file
            img = fopen(filename, "w");

            // check if image file is successfully created
            if (img == NULL)
            {
                fclose(file);
                free(bf);
                printf("Could not open file");
                return 3;
            }
            counter++;
        }

        //Check if any image file is alredy open
        if (counter > 0)
        {
            fwrite(bf, 512, 1, img);
        }
    }

    //Free memory & close files
    fclose(img);
    fclose(file);
    free(bf);
    return 0;
}