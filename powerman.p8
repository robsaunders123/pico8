pico-8 cartridge // http://www.pico-8.com
version 30
__lua__
function _init()

sfx(0)
sfx(1) 

warpintro={
     x = 20,
     y =-20,
done_y = 79,
 frame =  3,
 speed =  2,
  done = false,

update = function(self)
  if self.done==false then
    self.y = self.y+self.speed
  end
  if self.y >=self.done_y then
    self.done = true
    self.y = 0
  end
end,

draw = function(self)
 if self.y >=75 then
  self.frame=4
 end
 if not self.done==true then
   spr(self.frame,self.x,self.y)
   spr(self.frame+16,self.x,self.y+8) 
 end
end
} -- table warpintro


warp={
 x=x,y=y,
     frame=8,
      anim=false,
 anim_time=0,
 anim_wait=0.1,
      done=false,

 update = function(self)
   if warpintro.y >= warpintro.done_y-1 then
     self.anim=true
     self.anim_time=time()
   end
  
   if self.anim==true and time() - self.anim_time > self.anim_wait then
     self.anim_time=time()
     self.frame+=1
   end 
   if self.frame>=14 then
     self.done=true
     self.anim=false
   end
 end, -- update function

 draw = function(self)
   print(self.anim_time)
   if warpintro.done==true then 
     spr(self.frame,20,88)
   end
   if self.frame==14 then
     self.done=true
     self.frame=16 
     startmusic(1)
   end
 end -- draw function
} -- warp table

 man={
  x=20,y=88,h=h,w=w,
  frame=14,turn=false,
  update=function(self)
    if btn(0) and warp.done== true then
      self.x-=1
      self.turn=true
    end
    if btn(1) and warp.done== true then
      self.x+=1
      self.turn=false
    end
  end, -- update

  draw=function(self)
    if warp.done == true then
      spr(self.frame,self.x,self.y,1,1)
      spr(self.frame+9,self.x,self.y-8,1,1,self.turn)
    end
  end -- draw function

 } -- man

bullet={
 x=man.x+6,
 y=man.y-1,
 move=false,
 done=true,
 update=function(self)
   if btnp(4)  and warp.done ==true
               and self.done ==true then
     sfx(2,1,1,10) 
     self.move=true
     self.done=false
   end
   if self.move==true and self.done==false then
     self.x+=4
     self.y-=4
   end
   if self.x > 128 then
     self.done=true
     self.x=man.x+6
     self.y=man.y-1
   end
 end, -- update function 

draw=function(self)
 if self.move==true
 and self.done==false then
 circfill(self.x,self.y,3,8)
 circfill(self.x,self.y,2,7)
 end
end
 } -- bullet table

end -- _init 

function _update()
warp:update()
warpintro:update()
man:update()
bullet:update()

end 

function _draw()
cls()
warp:draw()
warpintro:draw()
man:draw()
bullet:draw()
print(time())
rect(4,96,120,100,5)
rectfill(5,97,119,99,6)
print("⬅️ and ➡️ to move",30,30,7)
print("")
print("  🅾️/z to shoot")
end

function startmusic(n)
if (not music_playing) then
music(n) music_playing=true
end
end

__gfx__
00000000003cc30000000000009aa900000000000000009900000000009aa9000000a0000000000000000000000000000000000008088880009aa90000000000
000000000c8338c000000000099aa990000a00000000999990990000099aa990000aa000000000000000000000000000000000000a8888800a8998a000000000
007007003c8cc8c300000000099aa990000aa0000009999999999000099aa990090aa090000a00000000000000000000009aa900988999899a8aa8a900000000
00077000338cc83300000000099aa990090aa090000aa999999aa000099aa990090aa090090a0090000a0000009aa9000a8998a099899989998aa89900000000
000770003303303300000000099aa990090aa0900099aa9999aa9900099aa990099aa090999aa0999aa9aaa90a8998a09a8aa8a9990990999909909900000000
0070070000cccc0000000000099aa990090aa09000aa9aa99aa9aa00099aa990099aa990999aa999999aa9999a8aa8a9990aa09900aaaa0000aaaa0000000000
000000000330033000000000099aa990090a9090000a99aaaa99a000099aa990099aa9900a9aa9a0a999999a99a99a9999099099099009900990099000000000
00000000ccc00ccc00000000099aa99009099090000aa99aa99aa000009aa900009aa90000aaaa000aaaaaa0aaa00aaaaaa00aaaaaa00aaaaaa00aaa00000000
000000000000000000000000099aa990090990900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000099aa990099999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000099aa990099999900000009999000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003003333000000000099aa9900999a9900000aa9999aa0000800888800000000000000000000000000000000000000000000000000000000000000000
000000000333737000000000099aa990099aa99099a99aa9aaa99aa9088878700000000000000000000000000000000000000000000000000000000000000000
0000000030370c0000000000099aa9900aaaaaa0a99a99aa9999a99a80870a000000000000000000000000000000000000000000000000000000000000000000
0000000000cc7c7000000000099aa99009aaaa900aa9999999999aa000aa7a700000000000000000000000000000000000000000000000000000000000000000
0000000000cc00c000000000009aa900009aa900000aaa9aa9a9a00000aa00a00000000000000000000000000000000000000000000000000000000000000000
__sfx__
170800003202132021300212f0212d0212b0212400128021250211800122021200211c0211b021190211602114021120210f02103001160211502113021110210f0210b0210a0210602104021010210002100021
110800003e1213e1213c1213b1213912137121001013412131121001012e1212c12128121271212512122121201211e1211b12103101161211512113121111210f1210b1210a1210612104121011210012100101
0001000037150331502f1502a15026150221501d15018150141500010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
381000102885000800288002880028850288002880028800288502880028800288002885028800288002880000800008000080000800008000080000800008000080000800008000080000800008000080000800
01100000123550030506355123051235512305063551230512355063550230512355123050635512355063550e3550030502355123050e355123050235506305023550d355123050d355063050d3550e35502355
001000001e055180051e0551e0051e0551e0051e0551e00521055210551a005210551e005200551e0551c0551a055180051a0551e0051a0551e0051a0551e00521055210551e005210551e0051a0552105521055
2e4000001e5521e55221552215522a5522a552285522855226552265522455224552255522555225552255521f5023650236502365023650236502255021e502215021c5021e502215021e5021d5021d5021e502
2e4000002655226552245522455225552255522555225552000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002
2e4000001e5521e55221552215522a5522d552285522855226552245522355224552255522555225552255521f5023650236502365023650236502255021e502215021c5021e502215021e5021d5021d5021e502
__music__
03 41440544
01 41040544
00 03040544
00 03040506
00 03040507
00 03040508
02 03040507

