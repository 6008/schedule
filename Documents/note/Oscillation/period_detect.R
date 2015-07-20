period_detect <- function(input_file_name, output_file_name, with_emd, with_header = FALSE) {
  data <- read.table(input_file_name, header = with_header);
  data <- data[,2];
  data <- data - mean(data);
  data <- data / max(abs(data));
  data_copy <- data;
  if (with_emd) {
    require("EMD");
    res <- emd(data);
    data <- data - res$residue;
  }
  conv1 <- convolve(c(data,data[(length(data)-1):1]), data, type="f") / length(data);
  conv2 <- convolve(data, data, type = "o");
  conv2 <- conv2[length(data):length(conv2)] / c(length(data):1);
  png(file = output_file_name);
  options(device="png");
  par(mfrow = c(3,1), mar = c(2, 1, 2, 1));
  plot(data_copy);
  abline(h=0);
  plot(conv1);
  abline(h=0);
  plot(conv2);
  abline(h=0);
  box();
  dev.off();
}