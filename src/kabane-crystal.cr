require "../lib/discordcr/src/discordcr"
require "../lib/dotenv/src/dotenv"
require "json"

module Kabane::Crystal
  VERSION = "0.1.0"

end

envs = Dotenv.load(".env")
client = Discord::Client.new(token: "Bot #{envs["TOKEN"]}")
client.cache = Discord::Cache.new(client)

client.on_message_create do |payload|
  if payload.content.starts_with? "hy?ping"
    current_time = Time.utc
    message = client.create_message(payload.channel_id, "ð ãã³ã°ä¸­â¦")
    end_time = Time.utc
    elapsed = (end_time - current_time).milliseconds
    client.edit_message(payload.channel_id, message.id, "ð ãã³ï¼\nã¬ã¤ãã³ã·ï¼#{elapsed}ããªç§ã")
  end

  if payload.content.starts_with? "hy?about"
    embed = Discord::Embed.new()
    author = Discord::EmbedAuthor.new()
    author.name = "æªç©äºå¤ã®å¤ç¾½"
    author.icon_url = "https://cdn.discordapp.com/avatars/823391183035170816/c6deb16aa863aae3ad640e654380bbcd.webp?size=1024"
    embed.author = author
    embed.description = "The Land of Cute Boisã®å¤ç¾½ã\nå¤ç¾½ã¯ã¢ãã¡ã»ãã³ã¬ã[æªç©äºå¤](https://kemonojihen-anime.com/)ãã®ä¸»äººå¬ã§ãã\nå¤ç¾½ãã¼ã¸ã§ã³0.5ã®éçºèï¼\n**Tetsuki Syu#1250ãKirito#9286**\nå¶ä½è¨èªã»ãã¬ã¼ã ã¯ã¼ã¯ï¼\n[Crystal](https://crystal-lang.org/)ã¨[Discordcr](https://github.com/shardlab/discordcr)ã©ã¤ãã©ãªã"
    embed.footer = Discord::EmbedFooter.new()
    embed.footer.try &.text = "å¤ç¾½ãããï¼ãªãªã¼ã¹ 0.5 | 2021-04-13"
    embed.thumbnail = Discord::EmbedThumbnail.new("https://cdn.discordapp.com/attachments/811517007446671391/831368495753068554/crystal_icon.png")
    embed.colour = 0x000000
    embed.title = ""
    client.create_message(payload.channel_id, "", embed: embed)
  end
end

client.run