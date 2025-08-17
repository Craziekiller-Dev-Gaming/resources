var audioPlayer = null;

window.addEventListener('message', function (event) {
    if (event.data.Type === "playSound") {
        if (event.data.File === 'none') {
            if (audioPlayer != null) {
                audioPlayer.pause();
                audioPlayer = null;
            }
        } else {
            try {
                audioPlayer = new Howl({
                    src: ["./sounds/" + event.data.File + ".ogg"]
                });
                audioPlayer.volume(0.2);
                audioPlayer.play();
            } catch (err) {
                $.post(`https://${GetParentResourceName()}/msg`, JSON.stringify({
                    text: err.message
                }));
            }
        }
    }
});