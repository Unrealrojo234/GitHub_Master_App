<script>
	//Getting environment variables
	let username = import.meta.env.VITE_API_USERNAME;
	let api = import.meta.env.VITE_API_BASE;

	let followers = $state(null);
	let following = $state(null);
	let unfollowers = $state(null);

	let avatar_url = $state(null);
	let repos = $state(null);
	let bio = $state(null);

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
				followers = numbers(data.followers);
				following = numbers(data.following);
				unfollowers = numbers(data.not_followed_back);
			})
			.catch((err) => {
				console.log(err);
			});
	});

	//Getting user info
	$effect(() => {
		fetch(`https://api.github.com/users/${username}`)
			.then((res) => res.json())
			.then((data) => {
				console.log(data);
				avatar_url = data.avatar_url;
				repos = data.public_repos;
				bio = data.bio;
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
	<div>
		<img
			src={avatar_url}
			id="profile-pic"
			alt="Avatar"
			class="img-fluid"
			style="border-radius: 50%;"
		/>
		<p>
			<span style="color: cyan;">{username}</span> has <span style="color: lime;">{repos}</span> public
			repositories.
		</p>
		<p>
			<span style="color: cyan;">{username}</span> bio: <span style="color: lime;">{bio}</span>
		</p>
	</div>
	<h3>Stats</h3>
	<div id="stats">
		<img
			class="img-fluid"
			src="https://github-readme-stats.vercel.app/api?username={username}&show_icons=true&theme=merko"
			alt="stats"
		/>

		<img
			class="img-fluid"
			src="https://streak-stats.demolab.com/?user={username}&theme=merko"
			alt="streak"
		/>

		<img
			class="img-fluid"
			src="https://github-readme-stats.vercel.app/api/top-langs/?username={username}&layout=donut&theme=merko"
			alt="top-languages"
		/>
	</div>
	<br />
	<div>
		<ul>
			<li>
				<p><a href="Followers">Followers </a> 🤩: <span style="color: lime;">{followers}</span></p>
			</li>
			<li>
				<p><a href="Following">Following</a> 🙂‍↕️: <span style="color: cyan;">{following}</span></p>
			</li>
			<li>
				<p>
					<a href="Unfollowers">Unfollowers </a> 😩: <span style="color: red;">{unfollowers}</span>
				</p>
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
	#profile-pic {
		max-width: 12rem;
	}
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
