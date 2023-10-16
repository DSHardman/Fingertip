function [temp, hum, letter, responses, times] = getattempt(i)
    load("Signals/materials_"+string(i)+".mat");
    load("materialsenv.mat");
    temp = presstemps(i);
    hum = presshums(i);
    load("letters.mat");
    letter = presslocs(i);
end