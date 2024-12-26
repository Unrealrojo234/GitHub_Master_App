<script>
	//Getting environment variables
	let username = import.meta.env.VITE_API_USERNAME;
	let api = import.meta.env.VITE_API_BASE;

	let followers = $state(null);
	let following = $state(null);
	let unfollowers = $state(null);

	//Function to count the number of followers, following and unfollowers
	const numbers = (data) => {
		let count = 0;
		for (const key in data) {
			if (data.hasOwnProperty(key)) {
				count++;
			}
		}
		return count;
	};

	//Fetching data from the API
	$effect(() => {
		fetch(`${api}/status`)
			.then((res) => res.json())
			.then((data) => {
				console.log(data);
				followers = numbers(data.followers);
				following = numbers(data.following);
				unfollowers = numbers(data.not_followed_back);
			})
			.catch((err) => {
				console.log(err);
			});
	});
</script>

<main>
	<h1 id="head">GitHub Master</h1>
	<!-- svelte-ignore a11y_distracting_elements -->
	<p id="moving-text">
		GitHub Master is a web application that allows you to search for your GitHub.
	</p>
	<p style="color: aqua;">Features:</p>
	<ul id="features">
		<li>Know your followers list.</li>
		<li>Know those who you follow but don't follow you back.</li>
		<li>Unfollowing people.</li>
	</ul>
	<h3>Stats</h3>
	<div id="stats">
		<img
			class="img-fluid"
			src="https://github-readme-stats-mu-eight-72.vercel.app/api?username={username}&show_icons=true&theme=merko"
			alt="stats"
		/>

		<img
			class="img-fluid"
			src="https://github-readme-stats-mu-eight-72.vercel.app/api/top-langs/?username={username}&layout=donut&theme=merko"
			alt="stats"
		/>
	</div>
	<br />
	<div>
		<ul>
			<li>
				<p>Followers 🤩: <span style="color: lime;">{followers}</span></p>
			</li>
			<li>
				<p>Following 🙂‍↕️: <span style="color: cyan;">{following}</span></p>
			</li>
			<li>
				<p>Unfollowers 😩: <span style="color: red;">{unfollowers}</span></p>
			</li>
		</ul>
	</div>
	<img
		src="https://i.pinimg.com/originals/e1/6e/ee/e16eee15cb361d1582dcbd8939e3f710.gif"
		loading="lazy"
		alt="Dancing anime girl"
		class="img-fluid"
	/>
	<br /><br />
	<span>Made by <a href="https://github.com/Unrealrojo234/" target="_blank">@Unrealrojo234</a></span
	>
</main>

<style>
	main {
		max-width: 48rem;
		display: block;
		margin: auto;
	}
	#stats {
		padding: 12px;
	}
	#head {
		text-align: center;
		font-size: 3rem;
		color: aqua;
	}
	p {
		font-size: 1.5rem;
		color: white;
	}
	#features li {
		font-size: 1.2rem;
		color: greenyellow;
	}
	#moving-text {
		text-shadow: 2px 1px 10px gold;
	}
</style>
