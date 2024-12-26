<script>
	let username = import.meta.env.VITE_API_USERNAME;
	let followers = $state([]);
	let page = $state(50);
	$effect(() => {
		fetch(`https://api.github.com/users/${username}/followers?per_page=${page}`)
			.then((res) => res.json())
			.then((data) => {
				console.log(data);
				followers = data;
			})
			.catch((err) => {
				console.log(err);
			});
	});
</script>

<main>
	<h1 class="text-center" style="color: lime;">Followers</h1>
	<div id="view">
		{#await followers}
			<p>Loading...</p>
		{:then followers}
			{#each followers as follower}
				<div id="follower">
					<img class="img-fluid" src={follower.avatar_url} alt={follower.login} />
					<p>{follower.login}</p>
				</div>
			{/each}
		{:catch error}
			<p>{error.message}</p>
		{/await}
		{#if followers.length === 0}
			<p>No followers found</p>
		{/if}
	</div>
	{#if followers.length >= page}
		<div id="btn-load">
			<button onclick={() => (page += 50)}>Load more</button>
			<a href="./"><button>Back</button></a>
		</div>
	{/if}
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
