function onCreatePost()
	if boyfriendName == 'bftroll3' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bftroll3-deadstring')
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'BFDeathNormal')
	elseif boyfriendName == 'shadow-high' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'shadow-high-dead')
		setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ShadowDies')
	end
end