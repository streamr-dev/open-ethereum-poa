
// read in env variables and modify the streamr-spec.json
const fs = require("fs")
const specfilename = "./streamr-spec.json"

const {
    NETWORK_ID,
} = process.env

console.log("Reading spec file: " + specfilename)
const spec = require(specfilename)

if (NETWORK_ID) {
    if (Number.isNaN(+NETWORK_ID)) {
        throw new Error(`Environment variable NETWORK_ID = "${NETWORK_ID}", expected a number`)
    }
    const networkID = "0x" + (+NETWORK_ID).toString(16)
    console.log(`Setting params.networkID = ${networkID}`)
    spec.params.networkID = networkID
}

const specstring = JSON.stringify(spec, null, 1)

console.log("Writing spec file")
fs.writeFileSync(specfilename, specstring)
