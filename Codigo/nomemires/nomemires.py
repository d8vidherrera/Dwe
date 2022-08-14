import pygame as pg

width = height = 650
win = pg.display.set_mode((width,height))
ball = pg.image.load('C:/Users/herre/OneDrive/Escritorio/Dwe/Codigo/nomemires/bola_imagen.png')
ballrect = ball.get_rect()

pg.display.set_caption('No me mires que nos miran.')

def specs():
    win.fill((255,204,255))       
    pg.display.update()
    
def main():
    fps = 30
    clock = pg.time.Clock()
    run = True
    while run:
        clock.tick(fps)
        for event in pg.event.get():
            if event.type == pg.QUIT:
                run = False
        specs()


        pg.draw.circle(win, ((0,0,0)), (width/2, width/2), 100)
        pg.display.update()



if __name__ == '__main__':
    main()