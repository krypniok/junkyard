/*



https://gist.github.com/superzazu/c0f923181a9cdb82c6d84dcf8b61c8c5



*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

#include <SDL2/SDL.h>
#include <SDL2/SDL_audio.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define MAX_SAMPLES 16

SDL_Event event;
SDL_Renderer *renderer;
SDL_Window *window;

// the representation of our audio device in SDL:
SDL_AudioDeviceID audio_devices[MAX_SAMPLES];

// opening an audio device:
SDL_AudioSpec audio_spec;
SDL_AudioSpec audio_have;

// pushing 3 seconds of samples to the audio buffer
float x = 0;

float freq = 440;
float freq_is = 440;
float dura_ms = 1000;
float gain = 32767;
float gain_step = 0;
int16_t sample;
const int sample_size = sizeof(int16_t) * 1;

int num_samples;


void play_normal(int device)
{
   // SDL_PauseAudioDevice(audio_device, 1);
    SDL_LockAudio();
    //dura_ms = 1000;
    num_samples = (((float)audio_spec.freq / 1000) * dura_ms);
    printf("num samples = %i\n", num_samples);
    printf("duration ms = %f\n", dura_ms);

    gain_step = (float)32768 / (float)num_samples;
    gain = 32767;

    for (int i = 0; i < num_samples; i++)
        {
  //      printf("[%05i]\t", i);
        // freq_is += ((float)(freq) / (float)audio_spec.freq);

   //     printf("gain = %f\t", gain);
    //    printf("gain step = %f\t", gain_step);

         x += ((float)freq_is / (float)audio_spec.freq);

        // if(i == num_samples - 1) { printf("HIT\n"); gain = 100; }

        float sine = (float)sin(x * 4);
       // sample = -32768 + rand() % 65535; //sine * gain
       sample = sine * gain;
       // printf("sine = %f\tsample = %i\n", sine, sample);
        SDL_QueueAudio(audio_devices[device], &sample, sample_size);
//        x += ((float)freq_is / (float)audio_spec.freq);
       // gain += gain_step; //(float)i * (float)(32768 / num_samples);
    }

    SDL_PauseAudioDevice(audio_devices[device], 0);
    SDL_UnlockAudio();
    //SDL_Delay(dura_ms);
    //sleep(10); // (dura_ms);
    usleep(dura_ms*1000);
}

int drawplasma(void)
{
    int y = 300;
    int x = 0;
    for (int i = 0; i < WINDOW_WIDTH; ++i)
    {
        SDL_RenderDrawPoint(renderer, x + i, y + sin(i) * 300);
    }
    SDL_RenderPresent(renderer);
}

int sinesamples[WINDOW_WIDTH];

int drawsinewave(void)
{
    int i, j = 0, x = 0, y = 300;

    for (i = 0; i < WINDOW_WIDTH; i++)
    {
        j = (float)sin(M_PI / WINDOW_WIDTH * i * 4) * 300;
        sinesamples[i] = j;
        SDL_RenderDrawPoint(renderer, x + i, y + j);
        printf("[%05i] sample = %i\n", i, sinesamples[i]);
    }
    SDL_RenderPresent(renderer);
}

int playsinewave(void)
{
    SDL_PauseAudioDevice(audio_devices[0], 1);
    SDL_LockAudio();    // Has no effect
    float g = 32768 / 300;
    int samp;
    for(int frequency=0; frequency<(44100 / 800); frequency++)
    for (int i = 0; i < WINDOW_WIDTH; i++)
    {
        samp = sinesamples[i];
        samp *= g;
        SDL_QueueAudio(audio_devices[0], &samp, sample_size);

 //       printf("[%05i] sample = %i\n", i, samp);
    }
   // samp = 0;
   // SDL_QueueAudio(audio_device, &samp, sample_size);
    SDL_PauseAudioDevice(audio_devices[0], 0);
    SDL_UnlockAudio();  // Has no effect
    SDL_Delay(1000+100); // TODO: Fix it! Why does it crack after last sample if i dont wait longer than wanted ?
}

pthread_t tid[2];

// void* doSomeThing(void *arg)

    int ind=0;

void* main2(void *arg)
//int main2()
{
    char str[128];
    int result;
    FILE* f = fopen("/home/simon/Dokumente/Skripte/textsampler/phaser.txt", "r");

    do {
        result = fscanf(f, "%127[^;\n]", str);

        if(result == 0)
        {
            result = fscanf(f, "%*c");
        }
        else
        {
            //Put here whatever you want to do with your value.
            printf("%s\n", str);
        }

    } while(result != EOF);

   // int index = &(int*)arg;
 audio_devices[ind] = SDL_OpenAudioDevice(NULL, 0, &audio_spec, &audio_have, SDL_AUDIO_ALLOW_FORMAT_CHANGE);

 play_normal(ind);

// SDL_Delay(1000);

    return 0;
}


int main(int argc, char *argv[])
{

    SDL_Init(SDL_INIT_AUDIO); // | SDL_INIT_VIDEO);
  //  SDL_CreateWindowAndRenderer(WINDOW_WIDTH, WINDOW_HEIGHT, 0, &window, &renderer);
    //SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
    //SDL_RenderClear(renderer);
    //SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

    SDL_zero(audio_spec);
    SDL_zero(audio_have);

    audio_spec.freq = 44100;
    audio_spec.format = AUDIO_S16SYS;
    audio_spec.channels = 1;
    audio_spec.samples = 1024;
    audio_spec.callback = NULL;

   
    freq = atof(argv[1]);
    freq_is = freq;
    dura_ms = atof(argv[2]);

    printf("test\n");
    {
    int i = 0;
    int err;

    while(i < 1)
    {
        err = pthread_create(&(tid[i]), NULL, &main2, NULL);
        if (err != 0)
            printf("\ncan't create thread :[%s]", strerror(err));
        else
            printf("\n Thread created successfully\n");

        i++;
    }

}

//    play_normal(0);

SDL_Delay(dura_ms);
//    drawsinewave();
//    playsinewave();

//    while (1)
//    {
//        if (SDL_PollEvent(&event) && event.type == SDL_QUIT)
//           break;
//       SDL_Delay(5);
//    }


    // unpausing the audio device (starts playing)
    //   SDL_PauseAudioDevice(audio_device, 0);
    // SDL_Delay(dura_ms);

 //   SDL_DestroyRenderer(renderer);
  //  SDL_DestroyWindow(window);

    // SDL_PauseAudioDevice(audio_device, 1);
    SDL_CloseAudioDevice(audio_devices[0]);
    SDL_CloseAudioDevice(audio_devices[1]);
    
    SDL_Quit();

    return EXIT_SUCCESS;
}