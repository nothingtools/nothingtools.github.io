const fs = require('fs');
const { Feed } = require('feed');

const rawData = fs.readFileSync('update.json', 'utf8');
const items = JSON.parse(rawData);

const feed = new Feed({
  title: "Nothing OS & App Updates",
  description: "Latest firmware and app updates tracker for Nothing Community.",
  id: "https://nothingfirmware.github.io",
  link: "https://nothingfirmware.github.io",
  language: "en",
});

items.forEach(item => {
  const postContent = `<img src="${item.image}" /><br/><p>New update available with version ${item.version} released on ${item.date}.</p>`;
  
  feed.addItem({
    title: `${item.title} (v${item.version})`,
    id: `${item.title.replace(/\s+/g, '-')}-${item.version}`,
    link: item.image,
    description: postContent,
    content: postContent,
    date: new Date(item.date)
  });
});

fs.writeFileSync('firmware.xml', feed.rss2());
console.log("Initial commit for Nothing Firmware!");
