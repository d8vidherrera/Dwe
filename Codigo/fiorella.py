import pygame 

width = height = 650
win = pygame.display.set_mode((width,height))

pygame.display.set_caption('No me mires que nos miran.')

def specs():
    win.fill((255,204,255))       
    pygame.display.update()
    
def main():
    fps = 60
    clock = pygame.time.Clock()
    run = True
    while run:
        clock.tick(fps)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
        specs()
        
        
    pygame.quit()

if __name__ == '__main__':
    main()