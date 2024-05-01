import globals from "globals";
import pluginJs from "@eslint/js";
import tseslint from "typescript-eslint";

const configurations = {
  indexer: [
    {
      files: ["indexer/**/*.js"],
      languageOptions: { globals: globals.node }
    },
    {
      files: ["indexer/**/*.js"],
      ...pluginJs.configs.recommended
    },
    {
      files: ["indexer/**/*.js"],
      ...tseslint.configs.recommended
    },
  ],
  sniper: [
    {
      files: ["sniper/**/*.js"],
      languageOptions: { globals: globals.node }
    },
    {
      files: ["sniper/**/*.js"],
      ...pluginJs.configs.recommended
    },
    {
      files: ["sniper/**/*.js"],
      ...tseslint.configs.recommended
    },
  ],
  ignores: ["**/*.test.js"], 
};

export default configurations;
