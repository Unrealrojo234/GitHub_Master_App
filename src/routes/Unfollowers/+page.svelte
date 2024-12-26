<script>
	let unfollowers = $state(null);
	let api = import.meta.env.VITE_API_BASE;

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

	let isUnfollowers = $state(false);
	//Fetching data from the API
	$effect(() => {
		$inspect(unfollowers);
		fetch(`${api}/status`)
			.then((res) => res.json())
			.then((data) => {
				unfollowers = data.not_followed_back;
				if (numbers(data.not_followed_back) > 0) {
					isUnfollowers = true;
				}
			})
			.catch((err) => {
				console.log(err);
			});
	});

	//Unfollow all
	const unfollowAll = () => {
		fetch(`${api}/unfollow_all_non_followers`)
			.then((res) => res.json())
			.then((data) => {
				console.log(data);
				unfollowers = [];
				isUnfollowers = false;
			})
			.catch((err) => {
				console.log(err);
			});
	};

	//Unfollow one user
	const unfollow = (login) => {
		fetch(`${api}/unfollow/${login}`)
			.then((res) => res)
			.then((data) => {
				console.log(data);
				unfollowers = unfollowers.filter((unfollower) => unfollower.login !== login);
				if (unfollowers.length === 0) {
					isUnfollowers = false;
				}
			})
			.catch((err) => {
				console.log(err);
			});
	};
</script>

<main>
	<h1 class="text-center" style="color: lime;">Unfollowing</h1>
	{#if !isUnfollowers}
		<p>There are no unfollowers!</p>
	{/if}
	<div id="view">
		{#await unfollowers}
			<p>Loading...</p>
		{:then unfollowers}
			{#each unfollowers as unfollower}
				<div id="follower">
					<img class="img-fluid" src={unfollower.avatar_url} alt={unfollower.login} />
					<p>{unfollower.login}</p>
					<button
						id="unfollow-btn"
						style="background-color:rgb(214, 51, 51);color:aliceblue;"
						onclick={() => unfollow(unfollower.login)}>Unfollow</button
					>
				</div>
			{/each}
		{:catch error}
			<p>{error.message}</p>
		{/await}
	</div>
	<div id="btn-load">
		<a href="./"><button>Back</button></a>
		{#if isUnfollowers}
			<button style="background-color:rgb(214, 51, 51);color:aliceblue;" onclick={unfollowAll}
				>Unfollow All</button
			>
		{/if}
	</div>
</main>

<style>
	#btn-load {
		margin: 1rem 0;
		text-align: center;
	}
	#follower {
		margin: 1rem 0;
		padding: 12px;
	}
	#view {
		display: grid;
		grid-template-columns: 2fr 3fr;
		grid-gap: 1rem;
		place-items: center;
	}
	img {
		max-width: 4rem;
		border-radius: 50%;
	}

	/* From Uiverse.io by alexmaracinaru */
	button {
		cursor: pointer;
		font-weight: 700;
		transition: all 0.2s;
		padding: 10px 20px;
		border-radius: 100px;
		background: limegreen;
		border: 1px solid transparent;
		font-size: 15px;
		display: inline-block;
	}

	button:hover {
		background: lime;
	}

	button:active {
		transform: scale(0.95);
	}
</style>
