require 'discordrb'

TOKEN = 'NTk5MTYxNjI0OTMwMDI1NDgy.XShK_w.glUWKqEL-4CVfMfRBSadeXLBX4U'
CLIENT_ID = 599161624930025482

# 通知用のチャンネルID
inform_channel = 599127299992059941

# bot
bot = Discordrb::Commands::CommandBot.new token: TOKEN, client_id: CLIENT_ID, prefix:'/'

# 誰かがvoice channelに出入りしたら発火
bot.voice_state_update do |event|
    # 発火させたユーザー名を取得
    user = event.user.name

    # もしデ-タが空だと抜けていったチャンネルを取得
    if event.channel == nil then
        # チャンネル名を取得
        channel_name = event.old_channel.name

        # 退出したことをinform_channelに通知
        bot.send_message(inform_channel, "@everyone #{user} が #{channel_name}を出たよ")
    else
        # チャンネル名を取得
        channel_name = event.channel.name

        # 入室したことをinform_channelに通知
        bot.send_message(inform_channel, "@everyone #{user} が #{channel_name}に入ったよ")
    end
end

# botを起動
bot.run
