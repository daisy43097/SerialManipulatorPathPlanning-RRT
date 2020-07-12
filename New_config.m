function q = New_config(qnear, qrand, deltaq)
a = ones(4,1)*deltaq;
q = qnear + a.*(qrand-qnear);