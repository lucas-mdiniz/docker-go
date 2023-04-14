#build the go application using the default go image
FROM golang AS builder
WORKDIR /go/src
COPY ./hello.go .
RUN go build hello.go && \
    ./hello

#change the build to use scratch, to get less than 2mb I have to use a small linux image
FROM scratch
WORKDIR /go/src
COPY --from=builder /go/src/hello .
CMD [ "./hello" ]
