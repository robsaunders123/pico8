pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
--init

function _init()
   _update = update_intro
   _draw = draw_intro
   
   t=0

   logo={}
   logo.x=-40
   
   colour=11
   
    player={
 x=x,
 y=y,
 turn=false,
 update=function(self)
  if btnp(➡️) then
    player.x+=8
    self.turn=false
  end
  if btnp(⬅️) then
    self.x-=8
    self.turn=true
  end
  end,
 draw=function(self)
  spr(1,player.x,player.y,1,1,player.turn)
 end
 }
 
ball = {
x=x,
y=y,
r=20,
pos=0.5,  --position on circle
update=function(self) 
self.x=self.r*sin(self.pos)+59
self.y=self.r*cos(self.pos)+59

if btnp(➡️) then
self.pos+=(1/7)
end
if btnp(⬅️) then
self.pos-=(1/7)
end
end,
draw=function(self)
circ(self.x,self.y,5,11)
end
}

ball2 = {
x=x,
y=y,
r=35,
pos=0.5,  --position on circle
update=function(self) 
self.x=self.r*sin(t/40)+59
self.y=self.r*cos(t/40)+59

end,
draw=function(self)
circfill(self.x,self.y,3,11)
end
}

smooth={
x=0,
y=0,
endx=0,
endy=0,
update=function(self)
 self.x+=(self.endx-self.x)/10
 self.y+=(self.endy-self.y)/10
 
 if btnp(⬇️) then
 self.endx=rnd(120)
 self.endy=rnd(120)
 end
end,
draw=function(self)
pset(self.x,self.y)
end
}

end --init end




-->8
--update and draw

function update_intro()
  logo.x+=2
  if logo.x>=50 then logo.x=50 end
  if btnp(❎) then
   -- player.x=50 player.y=50
    _update = update_menu
    _draw = draw_menu
  end
    
end

function draw_intro()
cls()
print("adam game",logo.x,59,11)
print("press ❎",logo.x,65,11)
end

function update_menu()
  if btnp(❎) then
    _update = update_game
    _draw = draw_game
    player.x=55 player.y=55  
  end
  if btnp(🅾️)
  then pal(11,rnd(32)) end
end

function draw_menu()
  cls()
  print("press ❎ to begin",20,59,colour)
  print("press 🅾️ to change colour",20,66,colour)
end

function update_game()
  t=t+1
  player:update()
  ball:update()
  ball2:update()
  smooth:update()
  
end

function draw_game()
  cls()
  --player:draw()
  ball:draw()
  ball2:draw()
  smooth:draw()
  print(t,5,5)
  print("press ⬅️,➡️, or ⬇️")
  circ(59,59,20)
  pset(59,59)
  circfill(5,t%40+39,4)

  
end


__gfx__
000000000bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b00000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbb00bbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
