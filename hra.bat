@echo off
color 0B
cls

echo " ░▒▓████████▓▒░░▒▓██████▓▒░░▒▓██████████████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░░▒▓███████▓▒░                                                                                                                                                                                    
echo "        ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░       
echo "      ░▒▓██▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
echo "     ░▒▓██▓▒░░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓██████▓▒   ░▒▓██████▓▒░  
echo "  ░▒▓██▓▒░    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░
echo " ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░
echo " ░▒▓████████▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░


rem Making the intro label
:GameIntro 
cls
echo Its the year 2029 and a zombie apocalypse has taken over the world, your goal is to get to the WHO secret lab and find the cure.
timeout 12
cls
echo You are walking through the abandoned city of Chicago and you suddenly find a telephone.
cls


rem Makin the telephone label + code input
:telephone
echo one is nine; two is eight; three is seven; four is six; five is five; six is four; seven is three; eight is two; nine is one; zero is zero.
timeout 8
cls 
echo This is an encrypted telephone, enter the correct combination to find the location of the secret hideout.
echo Here is a hint! The number was mentioned in the intro.
pause
set loopCount=3
set code=0000
set /a triesleft=%loopCount%
:loop
cls
set /p code="Enter the code: "
if "%code%"=="8081" (
    echo Access granted! The secret hideout is located at 41 mango street.
    timeout 5
    pause
    goto walking
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

rem Walking label 
:walking
cls
echo You are walking towards the secret hideout when you hear a noise behind you.
timeout 4
echo It was just a cat, you continue walking.
timeout 3
goto quest2

rem Making the quest2 label + choice 
:quest2
cls
echo You have reached the secret hideout, but a zombie is blocking the entrance!
timeout 5
echo You see 2 items on the ground: a knife and a mango.
timeout 4
echo Which one do you choose?
timeout 3
echo 1 = knife 
echo 2 = mango
choice /C 12
if errorlevel 2 (
    echo You throw the mango at the zombie. It didn't work! 
    timeout 4
    echo Although it made you very tuff for a moment, the zombie kills you. Game Over!
    timeout 5
    pause
    goto GameIntro
)
if errorlevel 1 (
    echo You pick up the knife and stab the zombie in the head!
    timeout 4
    echo You have successfully entered the secret hideout.
    timeout 4
    pause
    goto hideout 
)

rem Making the hideout label
:hideout
cls
echo Inside the hideout, you find a recording from a scientist.
timeout 4
echo The scientist says that to find the secret lab, you must solve a few math problems.
timeout 4
echo Each problem solved correcltly will give you a number to the the lab's safe combination.
timeout 5
echo So let's begin!
timeout 3
pause 
goto mathquiz

rem Making the math problems label 
:mathquiz
cls 
set /a score=0
echo First question: What is the square root of 256?
set /p answer1="enter number: "
if "%answer1%"=="16" (
    echo Correct!
    set /a score+=1
) else (
    echo Wrong! The correct answer is 16.
)
timeout 3
cls
echo Second question: What is (990 + 33)/33?
set /p answer2="enter number: "
if "%answer2%"=="31" (
    echo Correct!
    set /a score+=1
) else (
    echo Wrong! The correct answer is 31.
)
timeout 3
cls
echo Third and final question: What is 15 percent of 400?
set /p answer3="enter number: "
if "%answer3%"=="60" (
    echo Correct!
    set /a score+=1
) else (
    echo Wrong! The correct answer is 60.
)
timeout 3
cls 
echo You have completed the quiz! You got %score% out of 3 questions correct.
timeout 5
if %score%==3 (
    echo Amazing! You have unlocked the safe combination: 4241
    timeout 5
    pause
    goto walking2
) else (
    echo You did not get all questions correct. You cannot access the lab. Game Over!
    timeout 5
    pause
    goto GameIntro
)

rem Making another walking label
:walking2
cls
echo You walk out of the hideout towards the lab.
timeout 4
echo You can see zombies about 200 feet ahead of you, but it doesn't bother you because they are eating dead corpses.
timeout 6
echo You continue walking to the lab entrance. At the entrance, there is a door with a lock.
timeout 5
echo You open it because the lock was busted.
timeout 3
echo You enter the lab and walk towards the safe with the cure.
timeout 5
echo You thought that you have won, but a a few zombies are around the safe!
timeout 5
echo They aren't normal zombies, they are mutated zombies that are faster, stronger and smarter!
timeout 5
echo You have to fight them to get to the safe!
timeout 4
goto fight

rem Making the fight label
:fight
cls 
set /a chance = %random% %% 100
set /a chance2 = %random% %% 100
echo You see 3 mutated zombies approaching you!
timeout 4
echo You have 2 choices: fight them with your bare hands or use the knife you found earlier.
timeout 5
echo 1 = knife
echo 2 = bare hands
choice /C 12
if errorlevel 2 (
    cls
    echo You chose to fight with your bare hands.
    timeout 3
    echo There is a 70% chance of getting infected by the zombies.
    if %chance% LSS 70 (
        echo You got infected. Game over.
        timeout 3
        pause 
        goto GameIntro
   ) else (
        echo You somehow survived!
        timeout 3
        pause 
        goto safe
    )
)
if errorlevel 1 (
    cls
    echo You chose to use the knife. 
    timeout 4
    echo There is a 30% percent chance of getting infected.
    if %chance2% LSS 30 (
        echo You got infected. Game over.
        timeout 3
        pause 
        goto GameIntro
   ) else (
        echo You somehow survived.
        timeout 3
        pause 
        goto safe 
    )
)

rem making the safe label
:safe 
cls 
echo You approach the safe. Your hands are trembling as you enter the combination 4241.
timeout 5
echo The safe opens, revealing a vial of the cure!
timeout 4
echo You take the cure and inject yourself with it.
timeout 4
echo Now the cure is in your system, your blood contains antibodies that can fight the zombie virus!
timeout 5
echo Now you go to the WHO and help them make a vaccine for the whole world.
timeout 5
echo Congratulations! You have completed the game!
timeout 5
pause 

exit 


