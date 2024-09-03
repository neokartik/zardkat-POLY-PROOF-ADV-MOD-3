pragma circom 2.0.0;

template Multiplier2 () {  

   signal input a;
   signal x;  
   signal input b;  
   signal y;  
   signal output Q;

   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();
   
   andGate.a <== a;
   andGate.b <== b;
   notGate.in <== b;

   x <== andGate.out;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   
   Q <== orGate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = Multiplier2();