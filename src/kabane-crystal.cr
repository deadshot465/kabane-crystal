require "../lib/discordcr/src/discordcr"
require "json"

module Kabane::Crystal
  VERSION = "0.1.0"

end

client = Discord::Client.new(token: "Bot ODI4MjA0OTQ5NDEzODIyNDg0.YGmL9w.CkS2GCW8tLIgX-TWXKhSSVdJ50Y")
client.cache = Discord::Cache.new(client)

client.on_message_create do |payload|
  if payload.content.starts_with? "hy?ping"
    current_time = Time.utc
    message = client.create_message(payload.channel_id, "🏓 ピング中…")
    end_time = Time.utc
    elapsed = (end_time - current_time).milliseconds
    client.edit_message(payload.channel_id, message.id, "🏓 ポン！\nレイテンシ：#{elapsed}ミリ秒。")
  end

  if payload.content.starts_with? "hy?about"
    embed = Discord::Embed.new()
    author = Discord::EmbedAuthor.new()
    author.name = "怪物事変の夏羽"
    author.icon_url = "https://cdn.discordapp.com/avatars/823391183035170816/c6deb16aa863aae3ad640e654380bbcd.webp?size=1024"
    embed.author = author
    embed.description = "The Land of Cute Boisの夏羽。\n夏羽はアニメ・マンガ「[怪物事変](https://kemonojihen-anime.com/)」の主人公です。\n夏羽バージョン0.5の開発者：\n**Tetsuki Syu#1250、Kirito#9286**\n制作言語・フレームワーク：\n[Crystal](https://crystal-lang.org/)と[Discordcr](https://github.com/shardlab/discordcr)ライブラリ。"
    embed.footer = Discord::EmbedFooter.new()
    embed.footer.try &.text = "夏羽ボット：リリース 0.5 | 2021-04-13"
    embed.thumbnail = Discord::EmbedThumbnail.new("https://cdn.discordapp.com/attachments/811517007446671391/831368495753068554/crystal_icon.png")
    embed.colour = 0x000000
    embed.title = ""
    client.create_message(payload.channel_id, "", embed: embed)
  end
end

client.run