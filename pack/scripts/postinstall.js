const fs = require("fs");
const path = require("path");

function copyFile(source, destination) {
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  fs.copyFileSync(source, destination);
  console.log(`Copied: ${source} -> ${destination}`);
}

const binDir = path.join(__dirname, "../.bin");
const targetBinDir = path.join(__dirname, "../../.bin");

try {
  copyFile(path.join(binDir, "beautify-json.cmd"), path.join(targetBinDir, "beautify-json.cmd"));
  copyFile(path.join(binDir, "beautify-json.ps1"), path.join(targetBinDir, "beautify-json.ps1"));
  copyFile(path.join(binDir, "beautify-json.sh"), path.join(targetBinDir, "beautify-json"));
} catch (error) {
  console.error("Error copying files:", error.message);
  process.exit(1);
}
