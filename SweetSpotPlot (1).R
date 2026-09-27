# sweetspotplot.R
# Wesley Sutton
# 09/26/2026
# Generates the plot shown in Figure 7.6.

x <- 1:20

y <- c(-1.49, 3.37, 2.59, -2.78, -3.94, -0.92, 6.43, 8.51,
3.41, -8.23, -12.01, -6.58, 2.87, 14.12, 9.63,
-4.58, -14.78, -11.67, 1.17, 15.62)

# Create an empty plotting region without plotting points or lines.
plot(x, y, type = "n", main = "")

# Add horizontal lines at y = -5 and y = 5.
abline(h = c(-5, 5), col = "red", lty = 2, lwd = 2)

# Add vertical segments to form the sides of the sweet spot.
segments(
x0 = c(5, 15),
y0 = c(-5, -5),
x1 = c(5, 15),
y1 = c(5, 5),
col = "red",
lty = 3,
lwd = 2
)

# Plot values with y greater than or equal to 5 as purple X symbols.
points(
x[y >= 5],
y[y >= 5],
pch = 4,
col = "darkmagenta",
cex = 2
)

# Plot values with y less than or equal to -5 as green plus symbols.
points(
x[y <= -5],
y[y <= -5],
pch = 3,
col = "darkgreen",
cex = 2
)

# Plot points inside the sweet spot as blue filled circles.
points(
x[(x >= 5 & x <= 15) & (y > -5 & y < 5)],
y[(x >= 5 & x <= 15) & (y > -5 & y < 5)],
pch = 19,
col = "blue"
)

# Plot the remaining points outside the sweet spot as standard points.
points(
x[(x < 5 | x > 15) & (y > -5 & y < 5)],
y[(x < 5 | x > 15) & (y > -5 & y < 5)]
)

# Connect the coordinates with a dash-dot-dash line.
lines(x, y, lty = 4)

# Add an arrow pointing to the sweet spot.
arrows(x0 = 8, y0 = 14, x1 = 11, y1 = 2.5)

# Add the sweet spot label at the top of the arrow.
text(x = 8, y = 15, labels = "sweet spot")

# Add a legend for the line types and point symbols.
legend(
"bottomleft",
legend = c(
"overall process", "sweet", "standard", "too big",
"too small", "sweet y range", "sweet x range"
),
pch = c(NA, 19, 1, 4, 3, NA, NA),
lty = c(4, NA, NA, NA, NA, 2, 3),
col = c(
"black", "blue", "black", "darkmagenta",
"darkgreen", "red", "red"
),
lwd = c(1, NA, NA, NA, NA, 2, 2),
pt.cex = c(NA, 1, 1, 2, 2, NA, NA),
cex = 0.5
)