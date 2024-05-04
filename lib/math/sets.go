package main

import "fmt"

// Define a Set struct to represent a set of strings
type Set struct {
    data map[string]struct{}
}

// NewSet creates and returns a new Set
func NewSet() *Set {
    return &Set{
        data: make(map[string]struct{}),
    }
}

// Add inserts a new value into the Set
func (s *Set) Add(value string) {
    s.data[value] = struct{}{}
}

// Remove deletes a value from the Set
func (s *Set) Remove(value string) {
    delete(s.data, value)
}

// Contains checks if a value exists in the Set
func (s *Set) Contains(value string) bool {
    _, exists := s.data[value]
    return exists
}

// Size returns the number of elements in the Set
func (s *Set) Size() int {
    return len(s.data)
}

// Union returns a new Set with elements from both sets
func (s *Set) Union(anotherSet *Set) *Set {
    unionSet := NewSet()

    for key := range s.data {
        unionSet.Add(key)
    }

    for key := range anotherSet.data {
        unionSet.Add(key)
    }

    return unionSet
}

// Intersection returns a new Set with elements common to both sets
func (s *Set) Intersection(anotherSet *Set) *Set {
    intersectionSet := NewSet()

    for key := range s.data {
        if anotherSet.Contains(key) {
            intersectionSet.Add(key)
        }
    }

    return intersectionSet
}

// Difference returns a new Set with elements in the first set but not in the second set
func (s *Set) Difference(anotherSet *Set) *Set {
    differenceSet := NewSet()

    for key := range s.data {
        if !anotherSet.Contains(key) {
            differenceSet.Add(key)
        }
    }

    return differenceSet
}

func main() {
    // Supported token pairs for borrowing
    supportedPairs := NewSet()
    supportedPairs.Add("ETH-USD")
    supportedPairs.Add("BTC-USD")
    supportedPairs.Add("SOL-USD")

    // User wants to borrow
    userRequest := "ETH-USD"

    // Check if the requested pair is supported
    if supportedPairs.Contains(userRequest) {
        fmt.Println("Borrowing with", userRequest, "is supported.")

        // (Further logic to calculate borrowing limits, interest, etc. would go here) 

    } else {
        fmt.Println("Borrowing with", userRequest, "is not currently supported.")
    }
}