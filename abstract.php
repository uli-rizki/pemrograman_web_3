<?php

abstract class Kendaraan {
    abstract public function bergerak();
}

class Motor extends Kendaraan {
    public function bergerak() {
        return "Motor bergerak dengan roda dua.";
    }
}

$motor = new Motor();
echo $motor->bergerak();