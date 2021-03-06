const Providers = {
    spotify: async(info) => {
        
        const result = {
            uri: info.uri,
            karaoke: null,
            synced: null,
            unsynced: null,
            provider: "Spotify",
            copyright: null,
        };



        const baseURL = "hm://lyrics/v1/track/";
        const id = info.uri.split(":")[2];
        let body;
        try {
            body = await CosmosAsync.get(baseURL + id);
        } catch {
            return { error: "Request error", uri: info.uri };
        }

        const lines = body.lines;
        if (
            !lines ||
            !lines.length
        ) {
            return { error: "No lyric", uri: info.uri };
        }

        if (typeof lines[0].time === "number") {
            result.synced = lines
                .map((line) => ({
                    startTime: line.time,
                    text: line.words
                        .map(b => b.string)
                        .join(" "),
                }));
            result.unsynced = result.synced;
        } else {
            result.unsynced = lines
                .map((line) => ({
                    text: line.words.map(b => b.string).join(" "),
                }));;
        }

        result.provider = body.provider;

        return result;
    },

    musixmatch: async (info) => {
        const result = {
            error: null,
            uri: info.uri,
            karaoke: null,
            synced: null,
            unsynced: null,
            provider: "Musixmatch",
            copyright: null,
        };

        let list;
        try {
            list = await ProviderMusixmatch.findLyrics(info);
        } catch {
            result.error = "No lyric";
            return result;
        }

        const synced = ProviderMusixmatch.getSynced(list);
        if (synced) {
            result.synced = synced;
            result.copyright = list["track.subtitles.get"].message.body.subtitle_list[0].subtitle.lyrics_copyright.trim();
        }
        const unsynced = synced || ProviderMusixmatch.getUnsynced(list);
        if (unsynced) {
            result.unsynced = unsynced;
            result.copyright = list["track.lyrics.get"].message.body.lyrics.lyrics_copyright.trim();
        }

        return result;
    },

    netease: async (info) => {
        const result = {
            uri: info.uri,
            karaoke: null,
            synced: null,
            unsynced: null,
            provider: "Netease",
            copyright: null,
        };

        let list;
        try {
            list = await ProviderNetease.findLyrics(info);
        } catch {
            result.error = "No lyric";
            return result;
        }

        const karaoke = ProviderNetease.getKaraoke(list);
        if (karaoke) {
            result.karaoke = karaoke;
        }
        const synced = ProviderNetease.getSynced(list);
        if (synced) {
            result.synced = synced;
        }
        const unsynced = synced || ProviderNetease.getUnsynced(list);
        if (unsynced) {
            result.unsynced = unsynced;
        }

        return result;
    },
    genius: async (info) => {
        const result = await ProviderGenius.fetchLyrics(info);

        return {
            uri: info.uri,
            genius: result,
            provider: "Genius",
            karaoke: null,
            synced: null,
            unsynced: null,
            copyright: null,
            error: null,
        }
    },
};