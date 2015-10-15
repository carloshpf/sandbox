myfunction <- function() {
	x <- rnorm(100)
	mean(x)
}

second <- function(x) {
	x + rnorm(length(x))
}

for(i in 1:10) {
	print(i)
}


x <- c("a", "b", "c", "d")

for(letter in x) {
	print(letter)
}

for(i in seq_along(x)) {
	print(x[i])
}

for(i in 1:4) {
	print(x[i])
}

for(i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
	for(j in seq_len(ncol(x))) {
		print(x[i, j])
	}
}

z <- 5

while(z >= 3 && z <= 10) {
	print(z)
	coin <- rbinom(1, 1, 0.5)

	if(coin == 1) {
		z <- z + 1
	} else {
		z <- z - 1
	}
}

um <- 0
zero <- 0

for(i in 1:100000) {
	if(rbinom(1, 1, 0.5) == 1) {
		um <- um + 1
	} else {
		zero <- zero + 1
	}
}

print(um)
print(zero)