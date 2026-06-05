:set -XOverloadedStrings
import Sound.Tidal.Context

let tidal = startTidal (superdirtTarget {oAddress = "127.0.0.1", oPort = 57120, oLatency = 0.1}) (defaultConfig {cFrameTimespan = 1 / 20})

let d1 = streamReplace tidal 1
let d2 = streamReplace tidal 2
let d3 = streamReplace tidal 3
let d4 = streamReplace tidal 4
let hush = streamHush tidal
let list = streamList tidal
let mute = streamMute tidal
let unmute = streamUnmute tidal
let solo = streamSolo tidal
let unsolo = streamUnsolo tidal
let once = streamOnce tidal
let asap = streamOnce tidal
let nudgeAll = streamNudgeAll tidal
let resetCycles = streamResetCycles tidal
let setcps = asap . cps
let setbpm = setcps . (/ 60)
