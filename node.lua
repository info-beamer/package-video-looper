gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

util.no_globals()

local video

util.json_watch("config.json", function(config)
    if video then
        video:dispose()
    end
    video = resource.load_video{
        file = config.video.asset_name,
        looped = true,
        audio = config.audio,
        raw = true,
    }
end)

function node.render()
    gl.clear(0, 0, 0, 1)

    local x1, y1, x2, y2 = util.scale_into(NATIVE_WIDTH, NATIVE_HEIGHT, w, h)
    video:place(x1, y1, x2, y2):layer(2)
end
