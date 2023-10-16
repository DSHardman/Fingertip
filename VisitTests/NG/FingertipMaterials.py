import kg_robot as kgr
import time
import numpy as np
import random
from datetime import datetime

urnie = kgr.kg_robot(port=30010, db_host="169.254.150.50")
urnie.translatel_rel([0, 0, 0.02, 0, 0, 0], acc=0.1, vel=0.1)  # Ensure fingertip is not touching anything when we start

Aloc = [0.422808, -0.0381472, 0.026945, 3.11971, 0.0906952, 0.0193824]
Bloc = [0.424322, -0.0799269, 0.0258791, 3.11974, 0.0906299, 0.0193785]
Cloc = [0.425077, -0.126394, 0.026386, 3.11975, 0.0907278, 0.0192172]
Dloc = [0.425319, -0.171871, 0.0270535, 3.11973, 0.0906661, 0.0192538]
Eloc = [0.423315, -0.217678, 0.0281562, 3.11536, 0.112107, 0.00761599]
Floc = [0.423294, -0.263355, 0.0280255, 3.11547, 0.112173, 0.00743242]


def touchplace(letter, x, y):
    if letter == "A":
        loc = Aloc
    elif letter == "B":
        loc = Bloc
    elif letter == "C":
        loc = Cloc
    elif letter == "D":
        loc = Dloc
    elif letter == "E":
        loc = Eloc
    elif letter == "F":
        loc = Floc

    urnie.movel(np.add(loc, [x, y, 0.001, 0, 0, 0]), acc=0.1, vel=0.1)
    urnie.movel(np.add(loc, [x, y, -0.005, 0, 0, 0]), acc=0.1, vel=0.001)
    time.sleep(5)
    urnie.movel(np.add(loc, [x, y, 0.01, 0, 0, 0]), acc=0.1, vel=0.001)
    time.sleep(3)


# for i in range(10000):
#     letter = random.choice(["A", "B", "C", "D", "E", "F"])
#     present = datetime.now().strftime("%Y-%m-%d %H-%M-%S")
#     f = open(str(i)+"_2.txt", "w")
#     x = random.random()/200
#     y = random.random()/200
#     f.write(str(present) + " " + letter + " " + str(x) + str(y))
#     f.close()
#     print(i)
#     print(letter)
#     print(x)
#     print(y)
#     touchplace(letter, x, y)

touchplace("A", 0, 0)
touchplace("B", 0, 0)
touchplace("C", 0, 0)
touchplace("D", 0, 0)
touchplace("E", 0, 0)
touchplace("F", 0, 0)

urnie.close()
