package main

import (
	"log"
	"time"

	"github.com/kamaal111/AdventOfCode/2021/day1"
	"github.com/kamaal111/AdventOfCode/2021/day2"
	"github.com/kamaal111/AdventOfCode/2021/day3"
)

const inputPathDay1 = "day1/input.txt"
const inputPathDay2 = "day2/input.txt"
const inputPathDay3 = "day3/input.txt"

func main() {
	start := time.Now()

	log.Println("Day 1 Part 1:", day1.Part1(inputPathDay1))
	log.Println("Day 1 Part 2:", day1.Part2(inputPathDay1))

	log.Println("Day 2 Part 1:", day2.Part1(inputPathDay2))
	log.Println("Day 2 Part 2:", day2.Part2(inputPathDay2))

	log.Println("Day 3 Part 1:", day3.Part1(inputPathDay3))
	log.Println("Day 3 Part 2:", day3.Part2(inputPathDay3))

	elapsed := time.Since(start)
	log.Printf("Time: %s", elapsed)
}
