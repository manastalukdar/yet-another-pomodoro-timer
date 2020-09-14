package task

import (
	"fmt"
)

// Task struct
type Task struct {
	Name        string
	Description string
	TotalTime   int
	Break       int
	LongBreak   int
}

// TimeRemaining function
func (t Task) TimeRemaining() {
	fmt.Printf("%s %s has %d leaves remaining\n", t.Name, (t.LongBreak - t.Break))
}
