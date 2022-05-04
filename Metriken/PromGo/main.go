package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var addr = flag.String("listen-address", ":8080", "The address to listen on for HTTP requests.")

func greetings(w http.ResponseWriter, req *http.Request) {
	fmt.Fprint(w, "greetings\n")
	fmt.Println("there was a request")
	totalRequests.Inc()
}

var totalRequests = prometheus.NewCounter(
	prometheus.CounterOpts{
		Name: "http_requests_total",
		Help: "Number of get requests.",
	},
)

func main() {
	prometheus.MustRegister(totalRequests)
	fmt.Println("Starting Application")
	flag.Parse()
	http.HandleFunc("/", greetings)
	http.Handle("/metrics", promhttp.Handler())
	log.Fatal(http.ListenAndServe(*addr, nil))
}
