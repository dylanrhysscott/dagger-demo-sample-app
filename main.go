package main

import (
	"io"
	"log"
	"net/http"
)

func getRoot(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello from a dagger built app\n")
}

func main() {
	http.HandleFunc("/", getRoot)
	log.Fatal(http.ListenAndServe(":3000", nil))
}
