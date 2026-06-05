// SuperDirt startup script for TidalCycles
// Run with: sclang supercollider/start-superdirt.scd

(
s.options.numBuffers = 1024 * 256;
s.options.memSize = 8192 * 32;
s.options.numWireBufs = 64;
s.options.maxNodes = 1024 * 32;
s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    ~dirt.loadSoundFiles;
    s.sync;
    ~dirt.start(57120, [0, 0]);
    "*** SuperDirt started on port 57120 ***".postln;
};

s.latency = 0.3;
)
