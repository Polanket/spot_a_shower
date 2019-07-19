
const commitCounter = document.getElementById("commits")

const injectCommits = (commits) => {
  const html = `<p>Made with <span><strong>${commits}</strong></span> commits... and counting</p>`;
  commitCounter.insertAdjacentHTML("beforeend", html);
}

const getCommitCount = () => {
  fetch('https://api.github.com/repos/Polanket/spot_a_shower/stats/commit_activity')
    .then((response) => response.json())
    .then((commits) => injectCommits(commits[commits.length - 1].total));
};

export { getCommitCount };

