Toy Robot Simulator
===================
### About
This is my solution to the famous Toy Robot Simulator challenge in Ruby.


### Installation
Run the following commands in terminal. 
```
git clone https://github.com/SunLee128/toy_robot.git
gem install bundler && bundle install
```

### How to run
Run the following command in terminal.
```
 bundle exec exe/toy_robot commands.txt 
```

### How to test
Run the following command in terminal.
```
 rake spec
 ```

--------------------------------------------------
## Design 

### Considered Edge Cases
- First command is not 'PLACE'.
- First 'PLACE' command does not have valid x,y,f values. 
- First 'PLACE' command has x,y location outside of table.
- Any command other than 'PLACE', 'MOVE','LEFT','RIGHT','REPORT' 
- 'MOVE' command make Robot to fall from the current location.  

### Object Responsibilities

**Robot**
- moving
- turning
- knowing current x, y, face
- not falling

**Table**
- knowing a given point is within boundary

**Command**
- parsing a file into series of commands.
- cleaning string
- Knowing the first 'PLACE' command's x,y,f value. 

**Simulator**
- creating an instance of Table, Command and Robot
- checking the validity of the commands
- passing 'MOVE' and 'TURN' commands to Robot 
- REPORT
- PLACE
- ignores invalid commands
- collaborators: Robot, Table, Command

## Class Diagram
<div align="left">
    <img src="img/class_diagram.png" width="800px"</img> 
</div>

## Test Coverage
<div align="left">
    <img src="img/test_coverage.png" width="800px"</img> 
</div>


--------------------------------------------------
## Specification

### Description

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints

- The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

### Example Input and Output

#### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

#### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

#### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

### Deliverables

Please provide your source code, and any test code/data you using in
developing your solution.

Please engineer your solution to a standard you consider suitable for
production. It is not required to provide any graphical output showing the
movement of the toy robot.
