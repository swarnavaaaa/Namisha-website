const { Jimp } = require('jimp');
const path = require('path');

const images = ['Sunflower.png', 'Bluebells.png', 'Petunia.png', 'Rose.png', 'new-couch.jpg'];
const dir = __dirname;

function colorDistance(r1, g1, b1, r2, g2, b2) {
  return Math.sqrt((r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2);
}

async function removeBg(filename) {
  const img = await Jimp.read(path.join(dir, filename));
  const { width, height } = img.bitmap;
  const data = img.bitmap.data;
  const visited = new Uint8Array(width * height);
  const tolerance = 60; // catches white AND grey pixels

  // Sample background color from all 4 corners
  function getPixel(x, y) {
    const idx = (y * width + x) * 4;
    return { r: data[idx], g: data[idx+1], b: data[idx+2], idx };
  }

  const corners = [
    getPixel(0, 0), getPixel(width-1, 0),
    getPixel(0, height-1), getPixel(width-1, height-1)
  ];
  const bgR = Math.round(corners.reduce((s,c) => s+c.r, 0) / 4);
  const bgG = Math.round(corners.reduce((s,c) => s+c.g, 0) / 4);
  const bgB = Math.round(corners.reduce((s,c) => s+c.b, 0) / 4);

  // Flood fill from corners
  const queue = [];
  const seed = (x, y) => {
    const i = y * width + x;
    if (!visited[i]) { visited[i] = 1; queue.push([x, y]); }
  };
  seed(0, 0); seed(width-1, 0); seed(0, height-1); seed(width-1, height-1);

  while (queue.length > 0) {
    const [x, y] = queue.pop();
    const { r, g, b, idx } = getPixel(x, y);
    if (colorDistance(r, g, b, bgR, bgG, bgB) <= tolerance) {
      data[idx + 3] = 0; // transparent
      if (x > 0) seed(x-1, y);
      if (x < width-1) seed(x+1, y);
      if (y > 0) seed(x, y-1);
      if (y < height-1) seed(x, y+1);
    }
  }

  await img.write(path.join(dir, filename));
  console.log('Done: ' + filename);
}

(async () => {
  for (const file of images) {
    await removeBg(file);
  }
})();
