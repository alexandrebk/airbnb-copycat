import algoliasearch from "algoliasearch";

const initAlgoliaSearch = () => {
  const inputField = document.querySelector("#search");

  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('Flat');

    inputField.addEventListener("input", () => {
      index.search(inputField.value, { hitsPerPage: 10, page: 0 }).then((content) => {
        // array of results
        console.log(content.hits);
      }).catch(console.error);
    });
  }
}

export { initAlgoliaSearch };
