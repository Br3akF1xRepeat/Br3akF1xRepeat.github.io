module.exports = function(eleventyConfig) {
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

