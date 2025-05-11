module.exports = function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("src/assets/css/style.css");
  
  return {
    dir: {
      input: "src",
      assets: "_assets",
      includes: "_includes",
      layouts: "_layouts",
      output: "docs"
    }
  };
};

