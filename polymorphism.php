<?php

class Hewan {
    public function bersuara() {
        return "Suara hewan";
    }
}

class Kucing extends Hewan {
    public function bersuara() {
        return "Meong";
    }
}

class Anjing extends Hewan {
    public function bersuara() {
        return "Guk guk";
    }
}

$kucing = new Kucing();
echo $kucing->bersuara(); // Output: Meong

$anjing = new Anjing();
echo $anjing->bersuara();