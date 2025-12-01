@echo off
color 0B
cls

:GameIntro 
echo Its the year 2029 and a zombie apocalypse has taken over the world, your goal is to get to the WHO secret lab and find the cure.
timeout 12
cls
echo You are walking through the abandoned city of Chicago and you suddenly find a telephone.
cls

:telephone
echo one is nine; two is eight; three is seven; four is six; five is five; six is four; seven is three; eight is two; nine is one; zero is zero.
timeout 8
cls 
echo This is an encrypted telephone, enter the correct combination to find the location of the secret hideout.
echo Here is a hint! The number was mentioned in the intro.
pause
set loopCount=3
set /a triesleft=%loopCount%
:loop
cls
set /p code="Enter the code: "
if "%code%"=="8081" (
    echo Access granted! The secret hideout is located at 41 mango street.
    timeout 5
    pause
    goto quest2
)
set /a triesleft-=1
if %triesleft%==0 (
    echo You have exhausted all your tries! Game Over!
    timeout 5
    goto GameIntro
)
echo Wrong password! You have %triesleft% tries left.
timeout 2
goto loop

:walking
cls
echo You are walking towards the secret hideout when you hear a noise behind you.
timeout 4
echo It was just a cat, you continue walking.
timeout 3

:quest2
cls
echo You have reached the secret hideout, but a zombie is blocking the entrance!
pause
exit
